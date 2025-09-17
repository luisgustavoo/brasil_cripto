import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

import '../../models/coin.dart';
import '../../models/market.dart';

@Injectable(as: CoinsMarketsRepository, env: [Environment.test])
class FakeCoinsMarketsRepositoryRemote implements CoinsMarketsRepository {
  @override
  Future<Result<List<Coin>>> fetchCoinsMarkets(
    String? names,
    String vsCurrency,
  ) async {
    return Result.ok([kCoin]);
  }

  @override
  Future<Result<Market>> fetchCoinsMarketsChart(
    String id,
    String vsCurrency,
    int days,
  ) async {
    return Result.ok(kMarket);
  }
}
