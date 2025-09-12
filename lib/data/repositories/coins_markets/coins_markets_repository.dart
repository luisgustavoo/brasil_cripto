import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';

abstract class CoinsMarketsRepository {
  Stream<List<Coin>> get coinsMarketsStream;
  Future<Result<List<Coin>>> fetchCoinsMarkets(
    String? names,
    String vsCurrency,
  );
  Future<Result<void>> closeBackgroundService();
}
