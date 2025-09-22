import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';

abstract class FavoritesRepository {
  Stream<List<Coin>>? get favoriteCoins;
  Future<Result<void>> addFavorite(String id);
  Future<Result<void>> removeFavorite(String id);
  Future<Result<List<Coin>>> getFavorites(String vsCurrency);
  void starPollingService();
  void stopPollingService();
}
