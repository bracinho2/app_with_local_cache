import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/services.dart';

abstract class CheckAvailableConnection {
  Future<bool> isAvailableInternetConnection();
}

class CheckAvailableConnectionService implements CheckAvailableConnection {
  final Connectivity _connectivity;

  CheckAvailableConnectionService(
    this._connectivity,
  );

  @override
  Future<bool> isAvailableInternetConnection() async {
    try {
      return await _isEnabledLocalNetworkConnection() || await _checkStatus();
    } on PlatformException catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return false;
    }
  }

  Future<bool> _isEnabledLocalNetworkConnection() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();
      return connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi;
    } on PlatformException catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return false;
    }
  }

  Future<bool> _checkStatus() async {
    try {
      //Podemos utilizar um DNS/URL conforme necessidade;
      final result =
          await InternetAddress.lookup('8.8.8.8').timeout(const Duration(
        seconds: 5,
      ));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return false;
    }
  }
}
