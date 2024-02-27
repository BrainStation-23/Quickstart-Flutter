part of local_storage;

abstract class LocalStorageBase<TKey, TData extends BaseLocalData> {
  //initialize local storage if needed. if initialization is not needed then no need to implement
  Future<void> _initialize() async {}

  //implement write functionalities
  Future<void> write(TKey key, TData data);

  //implement read functionalities
  Future<TData?> read(TKey key);

  //implement remove functionality
  Future<bool> remove(TKey key);

  Future<bool> clearAll();

  //implement mapResponse to get TData from json got from local data
  TData mapResponse(Map<String, dynamic> json);
}
