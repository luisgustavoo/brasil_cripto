import 'package:brasil_cripto/config/dependencies.dart';
import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository_remote.dart';
import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/data/services/http/dio_http_client.dart';
import 'package:brasil_cripto/data/services/http/http_client.dart';
import 'package:brasil_cripto/data/services/local/local_data_service.dart';
import 'package:brasil_cripto/ui/coins_markets/view_models/coins_markets_view_model.dart';
import 'package:brasil_cripto/ui/coins_markets/widgets/coins_market_screen.dart';
import 'package:brasil_cripto/ui/favorites/view_models/favorite_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../testing/app.dart';
import '../../../../testing/fakes/services/fake_shared_preferences_service.dart';
import '../../../../testing/mocks.dart';

final getIt2 = GetIt.instance;

void main() {
  // late CoinsMarketViewModel viewModel;
  late MockGoRouter goRouter;

  void configureDependenciesTest() {
    getIt2
      ..registerFactory(
        () =>
            LocalDataService(sharedPreferences: FakeSharedPreferencesService()),
      )
      ..registerFactory<HttpClient>(
        DioHttpClient.new,
      )
      ..registerFactory<ApiClient>(
        () => ApiClient(httpClient: getIt2()),
      )
      ..registerFactory(
        () => FavoritesRepository(localDataService: getIt2()),
      )
      ..registerFactory<CoinsMarketsRepository>(
        () => CoinsMarketsRepositoryRemote(apiClient: getIt2()),
      )
      ..registerLazySingleton(
        () => FavoriteViewModel(favoritesRepository: getIt2()),
      );

    getIt2.registerLazySingleton<CoinsMarketViewModel>(
      () => CoinsMarketViewModel(
        coinsMarketsRepository: getIt2(),
      ),
    );
    print(
      getIt2.isRegistered(
        instance: CoinsMarketViewModel(
          coinsMarketsRepository: getIt2(),
        ),
      ),
    );
  }

  setUp(
    () async {
      // getIt2.reset();
      // configureDependenciesTest();
      // sobrescreve apenas o ApiClient
      // SharedPreferences.setMockInitialValues({});
      await configureDependencies(environment: Environment.test);
      // getIt
      //   ..unregister<SharedPreferences>()
      //   ..registerLazySingleton<FakeSharedPreferencesService>(
      //     FakeSharedPreferencesService.new,
      //   );
      goRouter = MockGoRouter();
    },
  );

  Future<void> loadScreen(WidgetTester tester) async {
    await testApp(
      tester,
      CoinsMarketScreen(viewModel: getIt2<CoinsMarketViewModel>()),
      goRouter: goRouter,
    );
  }

  group('coins market screen ...', () {
    testWidgets('1', (tester) async {
      await loadScreen(tester);
      final context = getContext(tester: tester, screen: CoinsMarketScreen);
      // expect(find.byType(List), findsOneWidget);
      // expect(find.text(context.l10n.noCryptocurrencyFound), findsOneWidget);
    });
  });
}
