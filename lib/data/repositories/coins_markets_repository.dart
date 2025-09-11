import 'package:brasil_cripto/data/services/api/models/coins_markets_model.dart';
import 'package:brasil_cripto/utils/result.dart';

abstract class CoinsMarketsRepository {
  Future<Result<List<CoinsMarketsModel>>> fetchCriptos();
}
