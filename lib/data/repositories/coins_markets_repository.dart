import 'package:brasil_cripto/domain/models/coins_markets.dart';
import 'package:brasil_cripto/utils/result.dart';

abstract class CoinsMarketsRepository {
  Future<Result<List<CoinsMarkets>>> fetchCoinsMarkets(String names);
}
