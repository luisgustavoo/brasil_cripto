import 'package:brasil_cripto/config/dependencies.dart';
import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/data/services/api/api_client.dart';
import 'package:brasil_cripto/domain/use_cases/favorites/favorite_get_use_case.dart';
import 'package:brasil_cripto/ui/coins_details/view_models/coins_details_view_model.dart';
import 'package:brasil_cripto/ui/coins_markets/view_models/coins_markets_view_model.dart';
import 'package:brasil_cripto/ui/coins_markets/widgets/coins_market_screen.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/favorites/view_models/favorite_view_model.dart';
import 'package:brasil_cripto/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../testing/app.dart';
import '../../../../testing/fakes/repositories/fake_coins_markets_repository_remote.dart';
import '../../../../testing/fakes/repositories/fake_favorites_repository_local.dart';
import '../../../../testing/fakes/services/api/fake_api_client.dart';
import '../../../../testing/mocks.dart';

void main() {
  late MockGoRouter goRouter;

  void configureDependenciesTest() {
    getIt
      ..registerFactory<ApiClient>(
        FakeApiClient.new,
      )
      ..registerFactory<CoinsMarketsRepository>(
        FakeCoinsMarketsRepositoryRemote.new,
      )
      ..registerFactory<FavoritesRepository>(
        FakeFavoritesRepositoryLocal.new,
      )
      ..registerFactory(
        () => FavoriteGetUseCase(
          coinsMarketsRepository: getIt(),
          favoritesRepository: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => CoinsMarketViewModel(
          coinsMarketsRepository: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => CoinsDetailsViewModel(
          coinsMarketsRepository: getIt(),
        ),
      )
      ..registerLazySingleton(
        () => FavoriteViewModel(
          favoriteGetUseCase: getIt(),
          favoritesRepository: getIt(),
        ),
      );
  }

  setUpAll(() async {
    await getIt.reset();
    configureDependenciesTest();
    goRouter = MockGoRouter();
  });

  Future<void> loadHomeScreen(WidgetTester tester) async {
    await testApp(
      tester,
      const HomeScreen(),
      goRouter: goRouter,
    );
    await tester.pumpAndSettle();
  }

  Future<void> searchItem(WidgetTester tester) async {
    await loadHomeScreen(tester);
    final marketTab = find.byKey(const Key(marketTabKey));
    await tester.tap(marketTab);
    await tester.pumpAndSettle();
    final searchField = find.byKey(const Key(searchEditKey));
    await tester.tap(searchField);
    await tester.pumpAndSettle();
    await tester.enterText(searchField, 'Bitcoin');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('(BTC)'), findsOneWidget);
  }

  group('HomeScreen / CoinsMarketScreen tests', () {
    testWidgets('should display title and empty state', (tester) async {
      await loadHomeScreen(tester);
      final context = getContext(tester: tester, screen: HomeScreen);
      expect(find.text(context.l10n.brazilCripto), findsOneWidget);
      expect(find.text(context.l10n.noCryptocurrencyFound), findsOneWidget);
    });

    testWidgets('should navigate to market tab and show search field', (
      tester,
    ) async {
      await loadHomeScreen(tester);
      final marketTab = find.byKey(const Key(marketTabKey));
      await tester.tap(marketTab);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key(searchEditKey)), findsOneWidget);
    });

    testWidgets('should search for a coin and display result', (tester) async {
      await searchItem(tester);
    });

    testWidgets('should search for Bitcoin and favorite it', (tester) async {
      await searchItem(tester);
      // Favorita o item
      final starBorderIcon = find.descendant(
        of: find.byKey(const Key('favorite-icon-bitcoin')),
        matching: find.byIcon(Icons.star_border),
      );
      await tester.tap(starBorderIcon);
      await tester.pump(const Duration(milliseconds: 100));
      final favoriteTab = find.byKey(const Key(favoriteTabKey));
      await tester.tap(favoriteTab);
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text('(BTC)'), findsOneWidget);
    });
    testWidgets('should navigate to coin details when tapping on a coin card', (
      tester,
    ) async {
      when(
        () => goRouter.push(any<String>(), extra: any(named: 'extra')),
      ).thenAnswer((_) async => null);
      await searchItem(tester);
      final bitcoinCard = find.widgetWithText(Card, 'Bitcoin');
      expect(bitcoinCard, findsOneWidget);
      await tester.tap(bitcoinCard);
      await tester.pump();
      verify(
        () => goRouter.push(any<String>(), extra: any(named: 'extra')),
      ).called(1);
    });
  });
}
