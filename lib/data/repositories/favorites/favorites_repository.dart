import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';

abstract class FavoritesRepository {
  Future<Result<void>> addFavorite(String id);
  Future<Result<void>> removeFavorite(String id);
  Future<Result<List<Coin>>> getFavorites(String vsCurrency);
}
