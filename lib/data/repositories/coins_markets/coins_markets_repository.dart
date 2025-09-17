import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/utils/result.dart';

abstract class CoinsMarketsRepository {
  Future<Result<List<Coin>>> fetchCoinsMarkets(
    String? names,
    String vsCurrency,
  );

  Future<Result<Market>> fetchCoinsMarketsChart(
    String id,
    String vsCurrency,
    int days,
  );
}
