part of local_storage;

abstract class SharedPreferenceBase<TData extends BaseLocalData>
    extends LocalStorageBase<String, TData> {
  late final SharedPreferences preference;



  SharedPreferenceBase(this.preference) ;
  @override
  Future<void> _initialize() async {
  }

  @override
  TData? read() {
    String? data = preference.getString(key);
    return data != null ? mapResponse(jsonDecode(data)) : null;
  }

  @override
  Future<void> write(TData data) async {
    await preference.setString(key, data.toString());
  }

  @override
  Future<bool> remove() async {
    return await preference.remove(key);
  }

  @override
  Future<bool> clearAll() async {
    return await preference.clear();
  }
}
