import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoritesRepository, env: [Environment.test])
class FakeFavoritesRepositoryLocal implements FavoritesRepository {
  @override
  Future<Result<void>> toggleFavorite(String name) async {
    return const Result.ok(null);
  }

  @override
  Future<Result<List<String>>> getFavorites() async {
    return const Result.ok(['Bitcoin']);
  }
}
