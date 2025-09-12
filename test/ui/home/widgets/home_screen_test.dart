import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository_remote.dart';
import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/data/services/local/local_data_service.dart';
import 'package:brasil_cripto/ui/coins_markets/view_models/coins_markets_view_model.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/favorites/view_models/favorite_view_model.dart';
import 'package:brasil_cripto/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../../../../testing/app.dart';
import '../../../../testing/fakes/services/api/fake_api_client.dart';
import '../../../../testing/fakes/services/fake_shared_preferences_service.dart';
import '../../../../testing/mocks.dart';

final getItTest = GetIt.instance;

void main() {
  // late CoinsMarketViewModel coinsMarketViewModel;
  // late FavoriteViewModel favoriteViewModel;
  late MockGoRouter goRouter;

  void configureDependencies() {
    getItTest
      ..registerFactory(
        () => FavoritesRepository(
          localDataService: LocalDataService(
            sharedPreferencesService: FakeSharedPreferencesService(),
          ),
        ),
      )
      ..registerLazySingleton(
        () => FavoriteViewModel(
          favoritesRepository: getItTest(),
        ),
      )
      ..registerFactory<CoinsMarketsRepository>(
        () => CoinsMarketsRepositoryRemote(
          apiClient: FakeApiClient(),
        ),
      )
      ..registerLazySingleton(
        () => CoinsMarketViewModel(
          coinsMarketsRepository: getItTest(),
        ),
      );
  }

  setUp(
    () {
      configureDependencies();
      goRouter = MockGoRouter();
    },
  );

  tearDown(() async {
    await getItTest.reset();
  });

  Future<void> loadScreen(WidgetTester tester) async {
    await testApp(
      tester,
      const HomeScreen(),
      goRouter: goRouter,
    );
  }

  group('home screen', () {
    testWidgets('1.', (tester) async {
      await loadScreen(tester);
      await tester.pumpAndSettle();
      final context = getContext(tester: tester, screen: HomeScreen);
      expect(find.text(context.l10n.brazilCripto), findsOneWidget);
      expect(find.text(context.l10n.noCryptocurrencyFound), findsOneWidget);
    });
    testWidgets('3', (tester) async {
      await loadScreen(tester);
      await tester.pumpAndSettle();
      final marketTabButtonKey = find.byKey(const Key('market-tab-button'));
      await tester.tap(marketTabButtonKey);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('search-edit')), findsOneWidget);
    });
    testWidgets('4', (tester) async {
      await loadScreen(tester);
      await tester.pumpAndSettle();
      final marketTabButtonKey = find.byKey(const Key('market-tab-button'));
      await tester.tap(marketTabButtonKey);
      await tester.pumpAndSettle();
      final edit = find.byKey(const Key('search-edit'));
      await tester.tap(edit);
      await tester.pumpAndSettle();
      await tester.enterText(edit, 'Bitcoin');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.widgetWithText(Card, 'Bitcoin'), findsOneWidget);
    });
  });
}
