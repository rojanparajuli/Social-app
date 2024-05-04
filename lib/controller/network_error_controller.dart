import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkError extends GetxController {
  var isConnected = true.obs;

  void checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    // ignore: unrelated_type_equality_checks
    if (connectivityResult == ConnectivityResult.none) {
      isConnected.value = false;
    } else {
      isConnected.value = true;
    }
  }
}