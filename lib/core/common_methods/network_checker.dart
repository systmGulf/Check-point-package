import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker {
  checkConnectivity(
      {required Function onSuccess, required Function onFailure}) async {
    List<ConnectivityResult> conmnectivityReult =
        await Connectivity().checkConnectivity();
    if (conmnectivityReult.contains(ConnectivityResult.mobile) ||
        conmnectivityReult.contains(ConnectivityResult.wifi)) {
      onSuccess();
    } else {
      onFailure();

      return false;
    }
  }
}
