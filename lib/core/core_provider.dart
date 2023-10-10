import 'package:app_with_local_cache/core/services/local_storage/local_storage.dart';
import 'package:app_with_local_cache/core/services/local_storage/local_storage_shared_preferences.dart';
import 'package:provider/provider.dart';

final coreProvider = [
  Provider<LocalStorage>(
    create: (_) => const LocalStorageSharedPreferences(),
  ),
];
