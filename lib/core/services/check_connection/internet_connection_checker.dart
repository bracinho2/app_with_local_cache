import 'dart:async';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionCheckerService {
  final InternetConnectionChecker _checker;
  InternetConnectionCheckerService(
    this._checker,
  );

  StreamController<bool> controller = StreamController();

  void cancelSubscription() {
    controller.close();
  }

  Future<bool> connectionTest() async {
    bool result = await _checker.hasConnection;
    if (result) {
      print('YAY! Free cute dog pics!');
    } else {
      print('No internet :( Reason:');
    }
    return result;
  }

  Stream<bool> getConnectionStatus() async* {
    _getStatus().onData((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          controller.add(true);
          break;
        case InternetConnectionStatus.disconnected:
          controller.add(false);
          break;
      }
    });

    yield* controller.stream.asBroadcastStream();
  }

  StreamSubscription<InternetConnectionStatus> _getStatus() {
    return _checker.onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          break;
        case InternetConnectionStatus.disconnected:
          break;
      }
    });
  }
}
