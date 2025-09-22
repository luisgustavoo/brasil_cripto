import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/ui/core/l10n/app_localizations.dart';
import 'package:brasil_cripto/ui/core/ui/coins_card.dart';
import 'package:brasil_cripto/ui/home/view_models/home_view_model.dart';
import 'package:brasil_cripto/ui/home/widgets/home_coins_market_tab.dart';
import 'package:brasil_cripto/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../../../testing/app.dart';
import '../../../../testing/fakes/repositories/fake_coins_markets_repository_remote.dart';
import '../../../../testing/fakes/repositories/fake_favorites_repository_remote.dart';
import '../../../../testing/mocks.dart';
import '../../../../testing/models/coin.dart';
import '../../../../testing/utils/print_widgets.dart';

void main() {
  late MockGoRouter goRouter;
  late HomeViewModel viewModel;
  late AppLocalizations l10n;
  late FakeFavoritesRepositoryRemote favoritesRepository;
  late FakeCoinsMarketsRepositoryRemote coinsMarketsRepository;

  setUp(() {
    goRouter = MockGoRouter();
    favoritesRepository = FakeFavoritesRepositoryRemote();
    coinsMarketsRepository = FakeCoinsMarketsRepositoryRemote();
    viewModel = HomeViewModel(
      coinsMarketsRepository: coinsMarketsRepository,
      favoritesRepository: favoritesRepository,
    )..init();
  });

  Future<void> loadScreen(WidgetTester tester) async {
    await testApp(
      tester,
      HomeScreen(
        viewModel: viewModel,
      ),
      goRouter: goRouter,
      builder: (appLocalizations) {
        l10n = appLocalizations;
      },
    );
  }

  group('Home Screen', () {
    testWidgets('should display title and empty state', (tester) async {
      await loadScreen(tester);
      expect(find.byType(HomeScreen), findsOneWidget);
    });
    testWidgets('2', (tester) async {
      await favoritesRepository.addFavorite('bitcoin');
      await loadScreen(tester);
      await viewModel.getFavorites.execute('brl');
      await tester.pumpAndSettle();
      expect(find.text(kCoin.name), findsOneWidget);
    });
    testWidgets(
      '3',
      (tester) async {
        await loadScreen(tester);
        final marketTab = find.byKey(const Key(marketTabKey));
        await tester.tap(marketTab);
        await viewModel.fetchCoinsMarkets.execute(
          (names: 'Bitcoin', vsCurrency: 'brl'),
        );
        await tester.pumpAndSettle();
        expect(find.text(kCoin.name), findsOneWidget);
      },
    );
    testWidgets(
      '4',
      (tester) async {
        when(
          () => goRouter.push(any<String>(), extra: any(named: 'extra')),
        ).thenAnswer((_) async => null);
        await loadScreen(tester);
        final marketTab = find.byKey(const Key(marketTabKey));
        await tester.tap(marketTab);
        await viewModel.fetchCoinsMarkets.execute(
          (names: 'Bitcoin', vsCurrency: 'brl'),
        );
        await tester.pumpAndSettle();
        final card = find.byType(CoinsCard);
        await tester.tap(card);
        verify(
          () => goRouter.push(any<String>(), extra: any(named: 'extra')),
        ).called(1);
      },
    );
  });
}
