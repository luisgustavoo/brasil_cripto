import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/utils/result.dart';

import '../../models/coin.dart';
import '../../models/market.dart';

class FakeCoinsMarketsRepositoryRemote implements CoinsMarketsRepository {
  @override
  Future<Result<List<Coin>>> fetchCoinsMarkets(
    String vsCurrency, {
    String? ids,
    String? names,
  }) async {
    return const Result.ok([kCoin]);
  }

  @override
  Future<Result<Market>> fetchCoinsMarketsChart({
    required String id,
    required String vsCurrency,
    required int days,
  }) async {
    return const Result.ok(kMarket);
  }
}
