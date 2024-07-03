
import 'env.dart';
import 'env_types.dart';

void main() async{
  Env environment = EnvProduction();
  await environment.init();
  environment.run();
}

class EnvProduction extends Env{

  @override
  EnvType get envType =>EnvType.production;

  @override
  // TODO: implement sentryDsn
  String get sentryDsn => throw UnimplementedError();

  @override
  // TODO: implement baseUrl
  bool get baseUrl => throw UnimplementedError();
}