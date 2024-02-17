part of local_storage;


abstract class BaseLocalData<TEntity> {
  const BaseLocalData();

  //toJson implementation provides what map/value to save to local db save to local db
  Map<String, dynamic> toJson();

  //toEntity implementation provides specific object to send to domain level
  TEntity toEntity();

  @override
  String toString()=> jsonEncode(toJson());
}