import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'COINGECKO_API_KEY', obfuscate: true)
  static final String coingeckoApiKey = _Env.coingeckoApiKey;
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;
}
