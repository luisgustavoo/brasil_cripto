import 'package:brasil_cripto/data/services/api/models/market_api_model.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';

abstract class CoinsMarketsRepository {
  Stream<List<Coin>> get coinsMarketsStream;
  Future<Result<List<Coin>>> fetchCoinsMarkets(
    String? names,
    String vsCurrency,
  );
  Future<Result<MarketApiModel>> fetchCoinsMarketsDetails(
    String id,
    String vsCurrency,
    int days,
  );
  Future<Result<void>> stopBackGroundFetchCoinsMarkets();
}
