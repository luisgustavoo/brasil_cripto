import 'package:brasil_cripto/data/repositories/coins_markets_repository.dart';
import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/data/services/api/models/coins_markets_model.dart';
import 'package:brasil_cripto/utils/result.dart';

class CoinsMarketsRepositoryRemote implements CoinsMarketsRepository {
  const CoinsMarketsRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;
  @override
  Future<Result<List<CoinsMarketsModel>>> fetchCriptos() async {
    return _apiClient.fetchData();
  }
}
