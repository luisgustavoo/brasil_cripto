import 'package:brasil_cripto/utils/result.dart';

abstract class FavoritesRepository {
  Future<Result<void>> toggleFavorite(String name);
  Future<Result<List<String>>> getFavorites();
}
