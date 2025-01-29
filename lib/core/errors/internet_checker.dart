import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

abstract class NetworkInfo {
  ValueNotifier<bool> get isConnected;
  Future<void> init();
}

class NetworkInfoImpl implements NetworkInfo {
  final ValueNotifier<bool> isConnected = ValueNotifier(true);

  @override
  Future<void> init() async {
    final result = await Connectivity().checkConnectivity();
    _isInternetConnected(result);
    Connectivity().onConnectivityChanged.listen(_isInternetConnected);
  }

  /// Handle connectivity changes
  void _isInternetConnected(List<ConnectivityResult>? result) {
    if (result == ConnectivityResult.none) {
      isConnected.value = false;
    } else if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
      isConnected.value = true;
    }
  }
}
