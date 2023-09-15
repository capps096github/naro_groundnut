import 'package:intl/intl.dart';

import '../../naro_exporter.dart';

class UtilService {
  ///Open the local sqlite database
  static Future<Database> openDB() async {
    return await openDatabase('NARO_GROUND_NUTS_${AppConfig.appVersion}',
        version: AppConfig.appVersion);
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

  // date formattter
  static String formatDate(String updatedAt) {
    String dateText = "__/__/___";

    if (updatedAt.toString().length < 5) {
      return "__/__/____";
    }

    try {
      DateTime date = DateTime.parse(updatedAt.toString());

      dateText = DateFormat("d MMM, y").format(date);
    } catch (e) {
      printer("Error parsing date: $e");
    }

    return dateText;
  }

  static int intParse(dynamic x) {
    if (x == null) {
      return 0;
    }
    int temp = 0;
    try {
      temp = int.parse(x.toString());
    } catch (e) {
      temp = 0;
    }

    return temp;
  }

  static String moneyFormat(String price) {
    int value0 = intParse(price);
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      if (value0 < 0) {
        value = "-$value";
      }
      return value;
    }
    return price;
  }
}
