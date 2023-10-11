import 'package:app_with_local_cache/core/services/check_available_connection/check_available_connection_service.dart';
import 'package:app_with_local_cache/core/services/local_storage/local_storage.dart';
import 'package:app_with_local_cache/core/services/local_storage/local_storage_shared_preferences.dart';
import 'package:app_with_local_cache/core/services/snackbar_manager/snackbar_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import 'services/check_connection/internet_connection_checker.dart';

final coreProvider = [
  Provider<InternetConnectionChecker>(
    create: (_) => InternetConnectionChecker(),
  ),
  Provider<InternetConnectionCheckerService>(
    create: (context) => InternetConnectionCheckerService(context.read()),
  ),
  Provider<Dio>(
    create: (_) => Dio(),
  ),
  Provider<Dio>(
    create: (_) => Dio(),
  ),
  Provider<Connectivity>(
    create: (_) => Connectivity(),
  ),
  Provider<LocalStorage>(
    create: (_) => const LocalStorageSharedPreferences(),
  ),
  Provider<SnackBarManager>(create: (_) => SnackBarManager()),
  Provider<CheckAvailableConnection>(
    create: (context) => CheckAvailableConnectionService(
      context.read(),
    ),
  ),
];
