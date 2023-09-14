// ignore_for_file: use_build_context_synchronously

import '../../naro_exporter.dart';

// * User service
final userServiceProvider = Provider<NaroUserService>((ref) {
  return NaroUserService(ref);
});

class NaroUserService {
  // context needed to show toasts for erros or success
  // final BuildContext context;

  final Ref ref;

  NaroUserService(this.ref);

  // Create an instance of Dio
  final Dio dio = Dio();

  //* sign up user
  Future<Response> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    // Define the an empty response
    Response response = Response(requestOptions: RequestOptions(path: loginEndPoint));

    // check if user is connected to the internet and perform actions
    await UtilService.isConnected().then((isOnline) async {
      if (isOnline) {
        // credentials
        Map<String, dynamic> credentials = {
          "email": email,
          "password": password,
          "name": name,
        };

        // headers
        Map<String, dynamic> headers = {
          "Content-Type": "application/json",
          "accept": "application/json",
        };

        try {
          // Make the POST request
          response = await dio.post(registerEndPoint,
              data: credentials, options: Options(headers: headers));
        } on DioException catch (error) {
          printer('Request failed with error: ${error.message}');
          ref.read(naroAPIErrorTextProvider.notifier).state =
              'Error Logging In. Try Again.\nError Code: ${error.message}';
        }
      } else {
        // update response
        response = Response(
          statusCode: 500,
          statusMessage: 'No internet connection',
          requestOptions: RequestOptions(path: loginEndPoint),
        );
      }
    });

    // Return the response
    return response;
  }

// * log in user (login)
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    // Define the an empty response
    Response response = Response(requestOptions: RequestOptions(path: loginEndPoint));

    // check if user is connected to the internet and perform actions
    await UtilService.isConnected().then((isOnline) async {
      if (isOnline) {
        // credentials
        Map<String, dynamic> credentials = {
          "email": email,
          "password": password,
        };

        // headers
        Map<String, dynamic> headers = {
          "Content-Type": "application/json",
          "accept": "application/json",
        };

        try {
          // Make the POST request
          response =
              await dio.post(loginEndPoint, data: credentials, options: Options(headers: headers));
        } on DioException catch (error) {
          printer('Request failed with error: ${error.response?.data}');
          ref.read(naroAPIErrorTextProvider.notifier).state =
              'Error Logging In. Try Again.\nError Data: ${error.response?.data}';
          // set the response
          if (error.response != null) {
            response = error.response!;
          }
        }
      } else {
        response = Response(
          statusCode: 500,
          statusMessage: 'No internet connection',
          requestOptions: RequestOptions(path: loginEndPoint),
        );
        // update authErrorTextProvider
        ref.read(naroAPIErrorTextProvider.notifier).state = 'No internet connection';
      }
    });

    // Return the response
    return response;
  }

// * log out the user
// by deleting the database
  Future<void> logout() async {
    // open the database
    await UtilService.openDB().then((localDB) async {
      // if the database is not open, show error toast and return
      if (!localDB.isOpen) {
        printer("Failed to init local store.");
        return;
      }

      // init the table
      await createUserTableIfNotExists(localDB).then((_) async {
        // delete the user from the table
        try {
          await localDB.delete(userTable).then((_) => printer("User deleted successfully"));
        } catch (e) {
          printer("Failed to delete user because ${e.toString()}");
        }
      });
    });
  }

  //* Save the user to local database
  Future<void> save(NaroUser appuser) async {
    // open the database
    await UtilService.openDB().then((localDB) async {
      // if the database is not open, show error toast and return
      if (!localDB.isOpen) {
        printer("Failed to init local store.");
        return;
      }

      // init the table
      await createUserTableIfNotExists(localDB).then((_) async {
        printer("User table ${localDB.toString()} created successfully");
        // insert the user to the table
        try {
          await localDB
              .insert(
                userTable,
                appuser.toMap(),
                conflictAlgorithm: ConflictAlgorithm.replace,
              )
              .then((_) => printer("User saved successfully"));
        } catch (e) {
          printer("Failed to save user because ${e.toString()}");
        }
      });
    });
  }

  /// create the user table if it doesn't exist
  Future<void> createUserTableIfNotExists(Database localDB) async {
    String sql = " CREATE TABLE IF NOT EXISTS "
        "$userTable ("
        "id INTEGER PRIMARY KEY,"
        // "username TEXT,"
        "password TEXT,"
        "name TEXT,"
        "avatar TEXT,"
        "remember_token TEXT,"
        "created_at TEXT,"
        "updated_at TEXT,"
        "email TEXT,"
        "token TEXT,"
        "cooperative_id INTEGER,"
        "value_chains TEXT"
        ")";

    try {
      // execute the sql
      await localDB
          .execute(sql)
          .then((_) => printer("User table created successfully", isSuccess: true));
    } catch (e) {
      printer('Failed to create table because ${e.toString()}');
    }
  }

  // get logged in user from the database
  Future<NaroUser?> getCurrentUser() async {
    // open the database
    return await UtilService.openDB().then((localDB) async {
      // if the database is not open, show error toast and return
      if (!localDB.isOpen) {
        printer("Failed to init local store.");
      }

      // init the table
      return await createUserTableIfNotExists(localDB).then((_) async {
        // insert the user to the table
        try {
          // List<Map<String, dynamic>> maps = await localDB.query(userTable, where: "1");
          List<Map<String, dynamic>> maps = await localDB.query(userTable, where: "1");
          printer("Records found: ${maps.length}");
          // latest user
          printer("Latest user: ${maps.first}");

          if (maps.isNotEmpty) {
            final currentAppUser = NaroUser.fromMap(maps.first);
            printer("User Service $currentAppUser");
            ref.read(naroUserProvider.notifier).state = currentAppUser;
            return currentAppUser;
          }
        } catch (e) {
          printer("Failed to get user because $e");
          ref.read(naroUserProvider.notifier).state = null;
          return null;
        }
        return null;
      });
    });
  }
}
