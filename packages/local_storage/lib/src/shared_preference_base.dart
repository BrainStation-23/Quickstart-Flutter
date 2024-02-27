part of local_storage;

abstract class SharedPreferenceBase<TData extends BaseLocalData>
    extends LocalStorageBase<String, TData> {
  late final SharedPreferences _preference;

  SharedPreferenceBase() {
    _initialize();
  }

  @override
  Future<void> _initialize() async {
    _preference = await SharedPreferences.getInstance();
  }

  @override
  Future<TData?> read(String key) async {
    String? data = _preference.getString(key);
    return data != null ? mapResponse(jsonDecode(data)) : null;
  }

  @override
  Future<void> write(String key, TData data) async {
    await _preference.setString(key, TData.toString());
  }

  @override
  Future<bool> remove(String key) async {
    return await _preference.remove(key);
  }

  @override
  Future<bool> clearAll() async {
    return await _preference.clear();
  }
}
