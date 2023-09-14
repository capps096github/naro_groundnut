import '../../naro_exporter.dart';

class UtilService {
  ///Open the local sqlite database
  static Future<Database> openDB() async {
    return await openDatabase('NARO_${AppConfig.appVersion}', version: AppConfig.appVersion);
  }

  ///is connected to the internet or not
  static Future<bool> isConnected() async {
    return await Connectivity().checkConnectivity().then((connectivityResult) {
      if (connectivityResult == ConnectivityResult.mobile) {
        //  connected to a mobile network.
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        //  connected to a wifi network.
        return true;
      } else {
        //  not connected to any network.
        return false;
      }
    });
  }
}
