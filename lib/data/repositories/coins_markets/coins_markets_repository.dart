import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/domain/models/market.dart';
import 'package:brasil_cripto/utils/result.dart';

abstract class CoinsMarketsRepository {
  Future<Result<List<Coin>>> fetchCoinsMarkets(
    String vsCurrency, {
    String? ids,
    String? names,
  });

  Future<Result<Market>> fetchCoinsMarketsChart({
    required String id,
    required String vsCurrency,
    required int days,
  });
}
