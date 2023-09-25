import '../../naro_exporter.dart';

//
final cropVariertyServiceProvider = Provider<CropVarietyService>((ref) {
  return CropVarietyService(ref);
});

// provider for the list of varieties
// this is set when we are reading varieties from the local db
// final cropVarietiesProvider = StateProvider<List<CropVariety>>((ref) => []);

class CropVarietyService {
  final Ref ref;

  CropVarietyService(this.ref);

  // Create an instance of Dio
  final Dio dio = Dio();

  ///* initialize crop varieties
  ///
  Future<List<CropVariety>> initializeVariaties() async {
    // get local varieties and if they are empty, then get online
    return await getAllVarieties().then((varieties) async {
      // if the varieties are empty, get online
      if (varieties.isEmpty) {
        // get all varieties from cloud and save them
        return await getCloudVarieties().then((response) async {
          printer('getting cloud Variateies');
          // check if the response is successful
          if (response.statusCode == 200) {
            printer('Gnuts Varieties Response = $response');

            // * Convert the response to a AppResponse
            // AppResponse appResponse = AppResponse.fromJson(response.data);
            // printer('Response = $appResponse');

            // if (appResponse.isSuccessful) {
              // get the data from the response
              final List<dynamic> data = response.data;

              // check if the data is not null
              if (data.isNotEmpty) {
                // delete existing varieties
                await deleteAllVarieties();

                // * then we can save the new varieties

                // convert the data to a list of varieties
                final List<CropVariety> cropVarieties = data.map((variety) {
                  return CropVariety.fromJson(variety);
                }).toList(); //
                printer("Cloud Varieties $cropVarieties");

                // save all varieties to the local db
                await saveAllVarieties(cropVarieties);

                // update the crop varieties provider
                // ref.read(cropVarietiesProvider.notifier).state = cropVarieties;

                // return the varieties
                return cropVarieties;
              }
            // }
          }
          // return an empty list
          return [];
        });
      } else {
        //
        // printer("Varieties $varieties updated successfully ${ref.watch(cropVarietiesProvider)}");

        // update the crop varieties provider
        // ref.read(cropVarietiesProvider.notifier).state = varieties;

        // return the varieties
        return varieties;
      }
    });
  }

  //* get all varieties from local db
  Future<List<CropVariety>> getAllVarieties() async {
    // open the database
    return await UtilService.openDB().then<List<CropVariety>>((localDB) async {
      // if the database is not open, show error toast and return
      if (!localDB.isOpen) {
        printer("Failed to init local store.");
        return [];
      }

      // init the table
      return await createVarietyTableIfNotExists(localDB).then<List<CropVariety>>((_) async {
        printer("Table ${localDB.toString()} created successfully");
        // query the table
        try {
          final List<Map<String, dynamic>> maps = await localDB.query(
            cropVarietyTable,
            where: "1",
            orderBy: ' id DESC ',
          );
          // return the list of varieties
          return List.generate(maps.length, (i) {
            return CropVariety.fromJson(maps[i]);
          });
        } catch (e) {
          printer("Failed to get varieties because ${e.toString()}");
          return [];
        }
      });
    });
  }

  //* get all from cloud,
  Future<Response> getCloudVarieties() async {
    final naroUser = ref.watch(naroUserProvider);
    // Define the an empty response
    Response response = Response(requestOptions: RequestOptions(path: cropVarietyEndPoint));

    // check if variety is connected to the internet and perform actions
    await UtilService.isConnected().then((isOnline) async {
      if (isOnline) {
        // headers
        Map<String, dynamic> headers = {
          "Authorization": "Bearer ${naroUser?.token}",
          "Content-Type": "application/sjson",
          "accept": "application/json",
        };

        try {
          // Make the POST request
          response = await dio.get(cropVarietyEndPoint, options: Options(headers: headers));
        } on DioException catch (error) {
          printer('Request failed with error: ${error.response?.data}');
          ref.read(naroAPIErrorTextProvider.notifier).state =
              'Error Submitting Form. Try Again.\nError Message: ${error.message} \nError Data: ${error.response?.data}';
        }
      } else {
        // update response
        response = Response(
          requestOptions: RequestOptions(path: cropVarietyEndPoint),
          data: {'message': 'No Internet Connection'},
        );

        // update error text
        ref.read(naroAPIErrorTextProvider.notifier).state = 'No Internet Connection. Try Again.';
      }
    });

    return response;
  }

  //* save all varieties to the lacal db via a batch
  Future<void> saveAllVarieties(List<CropVariety> cropVarieties) async {
    // open the database
    await UtilService.openDB().then((localDB) async {
      // if the database is not open, show error toast and return
      if (!localDB.isOpen) {
        printer("Failed to init local store.");
        return;
      }

      // init the table
      await createVarietyTableIfNotExists(localDB).then((_) async {
        printer("Table ${localDB.toString()} created successfully");
        // insert the variety to the table
        try {
          final batch = localDB.batch();
          for (final cropVariety in cropVarieties) {
            batch.insert(
              cropVarietyTable,
              cropVariety.json,
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
          }
          await batch
              .commit(continueOnError: true)
              .then((_) => printer("Varieties saved successfully"));
        } catch (e) {
          printer("Failed to save varieties because ${e.toString()}");
        }
      });
    });
  }

  /// * Delete a given crop variety from the local database
  Future<void> deleteThisVariety(CropVariety cropVariety) async {
    // varietyId
    final varietyId = cropVariety.id;

    // open the database
    await UtilService.openDB().then((localDB) async {
      // if the database is not open, show error toast and return
      if (!localDB.isOpen) {
        printer("Failed to init local store.");
        return;
      }

      // init the table
      await createVarietyTableIfNotExists(localDB).then((_) async {
        printer("Table ${localDB.toString()} created successfully");
        // insert the variety to the table
        try {
          await localDB.delete(
            cropVarietyTable,
            where: "id = ?",
            whereArgs: [varietyId],
          ).then((_) => printer("Variety deleted successfully"));
        } catch (e) {
          printer("Failed to delete variety because ${e.toString()}");
        }
      });
    });
  }

  /// * Delete all crop varieties from the local database
  Future<void> deleteAllVarieties() async {
    // first get local varieties an d

    // open the database
    await UtilService.openDB().then((localDB) async {
      // if the database is not open, show error toast and return
      if (!localDB.isOpen) {
        printer("Failed to init local store.");
        return;
      }

      // init the table
      await createVarietyTableIfNotExists(localDB).then((_) async {
        printer("Table ${localDB.toString()} created successfully");
        // insert the variety to the table
        try {
          await localDB
              .delete(cropVarietyTable)
              .then((_) => printer("All varieties deleted successfully"));
        } catch (e) {
          printer("Failed to delete all varieties because ${e.toString()}");
        }
      });
    });
  }

  ///* Create the variety table if it doesn't exist
  Future<void> createVarietyTableIfNotExists(Database localDB) async {
    String sql = "CREATE TABLE IF NOT EXISTS "
        "$cropVarietyTable ("
        "id INTEGER PRIMARY KEY,"
        "crop_id INTEGER,"
        "crop_variety_name TEXT,"
        "crop_variety_code TEXT,"
        "crop_variety_generation TEXT,"
        "created_at TEXT,"
        "updated_at TEXT,"
        "name_text TEXT"
        // -crop
        // "crop_id INTEGER,"
        // "crop_name TEXT,"
        // "crop_code TEXT,"
        // "number_of_days_before_submission INTEGER,"
        // "seed_viability_period INTEGER,"
        // "number_of_inspections INTEGER"
        ")";

    try {
      // Execute the SQL
      await localDB
          .execute(sql)
          .then((_) => printer("Variety table created successfully", isSuccess: true));
    } catch (e) {
      printer('Failed to create table because ${e.toString()}');
    }
  }
}
