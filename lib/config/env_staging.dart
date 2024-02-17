
import 'env.dart';
import 'env_types.dart';

void main() async{
  Env environment = EnvStaging();
  await environment.init();
  environment.run();
}

class EnvStaging extends Env{

  @override
  EnvType get envType =>EnvType.staging;
}