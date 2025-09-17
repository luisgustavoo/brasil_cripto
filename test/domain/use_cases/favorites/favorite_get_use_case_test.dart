import 'package:brasil_cripto/domain/use_cases/favorites/favorite_get_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../testing/fakes/repositories/fake_coins_markets_repository_remote.dart';
import '../../../../testing/fakes/repositories/fake_favorites_repository_local.dart';
import '../../../../testing/utils/result.dart';

void main() {
  late FavoriteGetUseCase favoriteGetUseCase;

  setUp(() {
    favoriteGetUseCase = FavoriteGetUseCase(
      favoritesRepository: FakeFavoritesRepositoryLocal(),
      coinsMarketsRepository: FakeCoinsMarketsRepositoryRemote(),
    );
  });
  group(
    'Favorite Get Use Case',
    () {
      test(
        'should return bitcoin as first favorite when currency is USD',
        () async {
          final result = await favoriteGetUseCase.getFavorites('usd');
          expect(result.asOk.value.first.id, 'bitcoin');
        },
      );
    },
  );
}
