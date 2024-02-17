part of api_base;

abstract class ApiRequest{
  const ApiRequest();

  Map<String,dynamic> toJson();

  @override
  String toString()=> jsonEncode(toJson());
}