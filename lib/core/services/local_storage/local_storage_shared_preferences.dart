import 'dart:developer';

import 'package:app_with_local_cache/core/services/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageSharedPreferences implements LocalStorage {
  const LocalStorageSharedPreferences();
  @override
  Future<dynamic> load({required String key}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(key)) {
      final doc = sharedPreferences.get(key);
      return doc;
    } else {
      return null;
    }
  }

  @override
  Future<bool> save({required String key, required value}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (value is String) {
      return sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return sharedPreferences.setBool(key, value);
    } else if (value is int) {
      return sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      return sharedPreferences.setStringList(key, value);
    }
    throw Exception('Value type (${value.runtimeType}) not valid');
  }

  @override
  Future<bool> remove({required String key}) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.remove(key);
      return true;
    } catch (e) {
      log(e.toString());
      log(StackTrace.current.toString());
      return false;
    }
  }
}
