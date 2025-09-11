import 'package:brasil_cripto/domain/models/coins_markets.dart';
import 'package:brasil_cripto/utils/result.dart';

abstract class CoinsMarketsRepository {
  Stream<List<CoinsMarkets>> get coinsMarketsStream;
  Future<Result<List<CoinsMarkets>>> fetchCoinsMarkets(
    String? names,
    String vsCurrency,
  );

  Future<Result<void>> closeBackgroundService();
}
