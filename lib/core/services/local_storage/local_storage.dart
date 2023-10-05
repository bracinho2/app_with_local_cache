abstract class LocalStorage {
  Future<dynamic> load({required String key});
  Future<bool> save({required String key, required value});
  Future<bool> remove({required String key});
  Future<List<String>?> loadMany({required String infoKey});
  Future<bool> saveMany(
      {required String infoKey, required List<String> dataList});
}
