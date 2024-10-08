import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {

  @EnviedField(varName: 'BASE_URL')
  static const baseUrl = _Env.baseUrl;

}