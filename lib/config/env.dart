import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'COIN_GECKO_API_KEY', obfuscate: true)
  static final String coinGeckoApiKey = _Env.coinGeckoApiKey;
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;
}
