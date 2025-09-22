import 'package:brasil_cripto/ui/core/ui/coins_card.dart';
import 'package:brasil_cripto/ui/home/view_models/home_view_model.dart';
import 'package:brasil_cripto/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../testing/app.dart';
import '../../../../testing/fakes/repositories/fake_coins_markets_repository_remote.dart';
import '../../../../testing/fakes/repositories/fake_favorites_repository_remote.dart';
import '../../../../testing/mocks.dart';
import '../../../../testing/models/coin.dart';

void main() {
  late MockGoRouter goRouter;
  late HomeViewModel viewModel;
  late FakeFavoritesRepositoryRemote favoritesRepository;
  late FakeCoinsMarketsRepositoryRemote coinsMarketsRepository;

  setUp(() {
    goRouter = MockGoRouter();
    favoritesRepository = FakeFavoritesRepositoryRemote();
    coinsMarketsRepository = FakeCoinsMarketsRepositoryRemote();
    viewModel = HomeViewModel(
      coinsMarketsRepository: coinsMarketsRepository,
      favoritesRepository: favoritesRepository,
    )..vsCurrency = 'brl';
  });

  Future<void> loadScreen(WidgetTester tester) async {
    await testApp(
      tester,
      HomeScreen(
        viewModel: viewModel,
      ),
      goRouter: goRouter,
    );
  }

  group('Home Screen', () {
    testWidgets(
      'should display title and empty state when no favorites are present',
      (tester) async {
        await loadScreen(tester);
        expect(find.byType(HomeScreen), findsOneWidget);
        favoritesRepository.stopPollingService();
      },
    );
    testWidgets(
      'should show favorite coin when repository already has a favorite',
      (tester) async {
        await favoritesRepository.addFavorite('bitcoin');
        await loadScreen(tester);
        await viewModel.getFavorites.execute();
        await tester.pumpAndSettle();
        expect(find.text(kCoin.name), findsOneWidget);
        favoritesRepository.stopPollingService();
      },
    );
    testWidgets(
      'should remove coin from favorites when toggleFavorite is executed',
      (tester) async {
        await loadScreen(tester);
        await favoritesRepository.addFavorite('bitcoin');
        await favoritesRepository.removeFavorite('bitcoin');
        await tester.pumpAndSettle();
        await viewModel.getFavorites.execute();
        expect(viewModel.favoriteCoins, isEmpty);
        favoritesRepository.stopPollingService();
      },
    );
    testWidgets(
      'should display searched coin in market tab after fetchCoinsMarkets',
      (tester) async {
        await loadScreen(tester);
        final marketTab = find.byKey(const Key(marketTabKey));
        await tester.tap(marketTab);
        await viewModel.fetchCoinsMarkets.execute('Bitcoin');
        await tester.pumpAndSettle();
        expect(find.text(kCoin.name), findsOneWidget);
        favoritesRepository.stopPollingService();
      },
    );
    testWidgets('should navigate to coin details when user taps a coin card', (
      tester,
    ) async {
      when(
        () => goRouter.push(any<String>(), extra: any(named: 'extra')),
      ).thenAnswer((_) async => null);
      await loadScreen(tester);
      final marketTab = find.byKey(const Key(marketTabKey));
      await tester.tap(marketTab);
      await viewModel.fetchCoinsMarkets.execute('Bitcoin');
      await tester.pumpAndSettle();
      final card = find.byType(CoinsCard);
      await tester.tap(card);
      verify(
        () => goRouter.push(any<String>(), extra: any(named: 'extra')),
      ).called(1);
      favoritesRepository.stopPollingService();
    });
  });
}
