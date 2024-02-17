
import 'env.dart';
import 'env_types.dart';

void main() async{
  Env environment = EnvDevelopment();
  await environment.init();
  environment.run();
}

class EnvDevelopment extends Env{

  @override
  EnvType get envType =>EnvType.development;
}