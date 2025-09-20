import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';

import '../../models/coin.dart';

class FakeFavoritesRepositoryRemote implements FavoritesRepository {
  final List<String> _ids = [];

  @override
  Future<Result<void>> addFavorite(String id) async {
    _ids.add(id);
    return const Result.ok(null);
  }

  @override
  Future<Result<List<Coin>>> getFavorites(String vsCurrency) async {
    if (_ids.isEmpty) {
      return const Result.ok(<Coin>[]);
    }
    return const Result.ok([kCoin]);
  }

  @override
  Future<Result<void>> removeFavorite(String id) async {
    _ids.remove(id);
    return const Result.ok(null);
  }
}
