import '../../naro_exporter.dart';

class AppFormService {
  ///* submit form method
  static Future<Response> submitForm({
    required NaroUser? sttsUser,
    required String formEndpoint,
    required Map<String, dynamic> formJson,
  }) async {
    // Create an instance of Dio
    final Dio dio = Dio();

    // Define the an empty response
    Response response = Response(requestOptions: RequestOptions(path: formEndpoint));

    // check if user is connected to the internet and perform actions
    await UtilService.isConnected().then((isOnline) async {
      if (isOnline) {
        // headers
        Map<String, dynamic> headers = {
          "Authorization": "Bearer ${sttsUser!.token}",
          "Content-Type": "application/json",
          "accept": "application/json",
        };

        try {
          printer('Making request for $formJson');
          // Make the POST request
          response = await dio.post(
            formEndpoint,
            data: FormData.fromMap(formJson),
            options: Options(headers: headers),
          );
          // .then((resp) =>
          // printer('Completer request $resp'));
        } on DioException catch (error) {
          printer('Request failed with error: ${error.response?.data}');
          // set the response
          response = Response(
            requestOptions: RequestOptions(path: formEndpoint),
            data: {'message': 'Error Submitting Form. Try Again.\nError: ${error.response?.data}'},
          );
        }
      } else {
        // update response
        response = Response(
          requestOptions: RequestOptions(path: formEndpoint),
          data: {'message': 'No Internet Connection'},
        );
      }
    });

    return response;
  }

  // get all seed producer forms from cloud,
  static Future<Response> getForms({
    required NaroUser? sttsUser,
    required String formEndpoint,
  }) async {
    // Create an instance of Dio
    final Dio dio = Dio();

    // Define the an empty response
    Response response = Response(requestOptions: RequestOptions(path: formEndpoint));

    // check if user is connected to the internet and perform actions
    await UtilService.isConnected().then((isOnline) async {
      if (isOnline) {
        // headers
        Map<String, dynamic> headers = {
          "Authorization": "Bearer ${sttsUser!.token}",
          "Content-Type": "application/json",
          "accept": "application/json",
        };

        try {
          // Make the POST request
          response = await dio.get(formEndpoint, options: Options(headers: headers));
        } on DioException catch (error) {
          printer('Request failed with error: ${error.message}');

           // set the response
          response = Response(
            requestOptions: RequestOptions(path: formEndpoint),
            data: {'message': 'Error Getting Forms. Try Again.\nError: ${error.response?.data}'},
          );
        }
      } else {
        // update response
        response = Response(
          requestOptions: RequestOptions(path: formEndpoint),
          data: {'message': 'No Internet Connection'},
        );
      }
    });

    return response;
  }
}
