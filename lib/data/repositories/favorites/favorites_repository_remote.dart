import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/data/services/shared_preferences_service.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FavoritesRepository)
class FavoritesRepositoryRemote implements FavoritesRepository {
  FavoritesRepositoryRemote({
    required SharedPreferencesService preferencesService,
    required ApiClient apiClient,
  }) : _preferencesService = preferencesService,
       _apiClient = apiClient;

  final SharedPreferencesService _preferencesService;
  final ApiClient _apiClient;

  @override
  Future<Result<void>> addFavorite(String id) {
    // TODO: implement addFavorite
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Coin>>> getFavorites(String vsCurrency) {
    // TODO: implement getFavorites
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> removeFavorite(String id) {
    // TODO: implement removeFavorite
    throw UnimplementedError();
  }
}
