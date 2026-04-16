import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();
  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: false,
        ),
        authMessages: [],
        localizedReason: 'Systm Gulf Authenticate',
      );
    } on PlatformException {
      return false;
    }
  }

  static Future<bool> biometricAuthMethod() async {
    final authPermission = await LocalAuthApi.hasBiometrics();
    final biometrics = await LocalAuthApi.getBiometrics();

    final authenticate = await LocalAuthApi.authenticate();
    if (authPermission && biometrics.contains(BiometricType.fingerprint) ||
        biometrics.contains(BiometricType.face) ||
        biometrics.contains(BiometricType.iris) ||
        biometrics.contains(BiometricType.strong) ||
        biometrics.contains(BiometricType.weak)) {
      if (authenticate) {
        return true;
      }
      return false;
    }
    return false;
  }

  static Future<bool> fingerPrintAuthenticate() async {
    final authPermission = await LocalAuthApi.hasBiometrics();
    final biometrics = await LocalAuthApi.getBiometrics();
    final authenticate = await LocalAuthApi.authenticate();
    if (authPermission ||
        biometrics.contains(BiometricType.fingerprint) ||
        biometrics.contains(BiometricType.face) ||
        biometrics.contains(BiometricType.iris) ||
        biometrics.contains(BiometricType.strong) ||
        biometrics.contains(BiometricType.weak)) {
      if (authenticate) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
