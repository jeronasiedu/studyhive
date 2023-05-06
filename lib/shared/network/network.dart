import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Checks for internet internet
abstract class NetworkInfo {
  /// Verifies if device has internet connection.
  Future<bool> hasInternet();
}

/// Implements [NetworkInfo]
class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> hasInternet() async {
    try {
      final results = await InternetConnectionChecker().hasConnection;
      return results;
    } on SocketException catch (_) {
      return false;
    }
  }
}
