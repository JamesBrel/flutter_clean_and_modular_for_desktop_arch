import 'package:connectivity_plus/connectivity_plus.dart';

import '../configs/connection_instance.dart';

class ConnectionCheckerRequest {
  static Future<bool> check() async {
    return await connectivity
        .checkConnectivity()
        .then((connectivityResult) async {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        return await internetConnectivity.hasConnection;
      } else {
        return false;
      }
    });
  }
}
