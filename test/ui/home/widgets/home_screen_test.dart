import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart';
import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository_remote.dart';
import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart';
import 'package:brasil_cripto/data/services/local/local_data_service.dart';
import 'package:brasil_cripto/ui/coins_markets/view_models/coins_markets_view_model.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/favorites/view_models/favorite_view_model.dart';
import 'package:brasil_cripto/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../testing/app.dart';
import '../../../../testing/fakes/services/api/fake_api_client.dart';
import '../../../../testing/fakes/services/fake_shared_preferences_service.dart';
import '../../../../testing/mocks.dart';

final getItTest = GetIt.instance;

void main() {
  late MockGoRouter goRouter;

  /// Configura GetIt com todas as dependências fake/mocadas
  void configureDependenciesTest() {
    // Limpa registros antigos
    getItTest
      ..reset()
      // Repositórios
      ..registerFactory<LocalDataService>(
        () => LocalDataService(
          sharedPreferencesService: FakeSharedPreferencesService(),
        ),
      )
      ..registerFactory<FavoritesRepository>(
        () => FavoritesRepository(
          localDataService: getItTest<LocalDataService>(),
        ),
      )
      ..registerFactory<CoinsMarketsRepository>(
        () => CoinsMarketsRepositoryRemote(apiClient: FakeApiClient()),
      )
      // ViewModels
      ..registerLazySingleton<FavoriteViewModel>(
        () => FavoriteViewModel(
          favoritesRepository: getItTest<FavoritesRepository>(),
        ),
      )
      ..registerLazySingleton<CoinsMarketViewModel>(
        () => CoinsMarketViewModel(
          coinsMarketsRepository: getItTest<CoinsMarketsRepository>(),
        ),
      );
  }

  setUp(() {
    configureDependenciesTest();
    goRouter = MockGoRouter();
  });

  tearDown(() async {
    await getItTest.reset();
  });

  Future<void> loadHomeScreen(WidgetTester tester) async {
    await testApp(
      tester,
      const HomeScreen(),
      goRouter: goRouter,
    );
    await tester.pumpAndSettle();
  }

  // Future<void> tapAppBarBackButton(WidgetTester tester) async {
  //   // garante que a árvore foi construída
  //   await tester.pumpAndSettle();

  //   // 1) Tenta BackButton diretamente
  //   final backButtonFinder = find.byType(BackButton);
  //   if (backButtonFinder.evaluate().isNotEmpty) {
  //     await tester.tap(backButtonFinder.at(0));
  //     await tester.pumpAndSettle();
  //     return;
  //   }

  //   // 2) Tenta IconButton dentro do AppBar
  //   final appBarFinder = find.byType(AppBar);
  //   if (appBarFinder.evaluate().isNotEmpty) {
  //     final iconButtonInsideAppBar = find.descendant(
  //       of: appBarFinder,
  //       matching: find.byType(IconButton),
  //     );
  //     if (iconButtonInsideAppBar.evaluate().isNotEmpty) {
  //       // tenta achar qual IconButton contém o arrow_back
  //       for (final el in iconButtonInsideAppBar.evaluate()) {
  //         final widget = el.widget as IconButton;
  //         final iconWidget = widget.icon;
  //         if (iconWidget is Icon) {
  //           final codePoint = iconWidget.icon?.codePoint;
  //           if (codePoint != null) {
  //             final hex = codePoint.toRadixString(16);
  //             // 0e5fa é arrow_back
  //             if (hex.toLowerCase() == 'e5fa' ||
  //                 hex.toLowerCase() == 'e5f9' /* ios variant */ ) {
  //               await tester.tap(find.byWidget(widget));
  //               await tester.pumpAndSettle();
  //               return;
  //             }
  //           }
  //         }
  //       }
  //       // se não encontrou por iconData, apenas tap no primeiro IconButton do AppBar
  //       await tester.tap(iconButtonInsideAppBar.at(0));
  //       await tester.pumpAndSettle();
  //       return;
  //     }
  //   }

  //   // 3) Tenta procurar pelo Icon explicitamente (arrow_back variants)
  //   var iconFinder = find.byIcon(Icons.arrow_back);
  //   if (iconFinder.evaluate().isEmpty) {
  //     iconFinder = find.byIcon(Icons.arrow_back_ios_new);
  //   }
  //   if (iconFinder.evaluate().isNotEmpty) {
  //     // preferir clicar no ancestor IconButton quando existir
  //     final iconButtonAncestor = find.ancestor(
  //       of: iconFinder,
  //       matching: find.byType(IconButton),
  //     );
  //     if (iconButtonAncestor.evaluate().isNotEmpty) {
  //       await tester.tap(iconButtonAncestor.at(0));
  //       await tester.pumpAndSettle();
  //       return;
  //     } else {
  //       // último recurso: tap no próprio Icon (tapAt no centro)
  //       final center = tester.getCenter(iconFinder.at(0));
  //       await tester.tapAt(center);
  //       await tester.pumpAndSettle();
  //       return;
  //     }
  //   }

  //   // 4) Tenta por Tooltip (texto do botão back - pode ser "Back" ou "Voltar" conforme locale)
  //   final tooltips = ['Back', 'Voltar'];
  //   for (final t in tooltips) {
  //     final tip = find.byTooltip(t);
  //     if (tip.evaluate().isNotEmpty) {
  //       await tester.tap(tip.at(0));
  //       await tester.pumpAndSettle();
  //       return;
  //     }
  //   }

  //   // 5) Fallback: tenta tapar na área "leading" do AppBar (aproximação)
  //   if (appBarFinder.evaluate().isNotEmpty) {
  //     final rect = tester.getRect(appBarFinder.at(0));
  //     final tapPoint = Offset(rect.left + 24.0, rect.center.dy);
  //     await tester.tapAt(tapPoint);
  //     await tester.pumpAndSettle();
  //     return;
  //   }

  //   // debug: mostra widgets úteis para diagnosticar
  //   debugPrint(
  //     '== tapAppBarBackButton: nothing found. Dumping some diagnostics:',
  //   );
  //   debugPrint('AppBar count: ${find.byType(AppBar).evaluate().length}');
  //   debugPrint(
  //     'BackButton count: ${find.byType(BackButton).evaluate().length}',
  //   );
  //   debugPrint(
  //     'IconButton count: ${find.byType(IconButton).evaluate().length}',
  //   );
  //   for (final el in find.byType(IconButton).evaluate()) {
  //     final widget = el.widget as IconButton;
  //     debugPrint('IconButton widget.icon = ${widget.icon}');
  //   }
  //   // Se chegou aqui, falhou
  //   throw Exception('Back button not found by any strategy');
  // }

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
      final marketTabButtonKey = find.byKey(const Key('market-tab-button'));
      await tester.tap(marketTabButtonKey);
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('search-edit')), findsOneWidget);
    });

    testWidgets('should search for a coin and display result', (tester) async {
      await loadHomeScreen(tester);
      await tester.pump();
      final marketTabButton = find.byKey(const Key('market-tab-button'));
      await tester.tap(marketTabButton);
      await tester.pumpAndSettle();
      final searchField = find.byKey(const Key('search-edit'));
      await tester.tap(searchField);
      await tester.pumpAndSettle();
      await tester.enterText(searchField, 'Bitcoin');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.widgetWithText(Card, 'Bitcoin'), findsOneWidget);
    });

    testWidgets('should search for Bitcoin and favorite it', (tester) async {
      await loadHomeScreen(tester);
      await tester.pump();
      final marketTabButtonKey = find.byKey(const Key('market-tab-button'));
      await tester.tap(marketTabButtonKey);
      await tester.pumpAndSettle();
      final searchField = find.byKey(const Key('search-edit'));
      await tester.tap(searchField);
      await tester.pumpAndSettle();
      await tester.enterText(searchField, 'Bitcoin');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(milliseconds: 100));
      final bitcoinCard = find.widgetWithText(Card, 'Bitcoin');
      final starIcon = find.descendant(
        of: bitcoinCard,
        matching: find.byIcon(Icons.star_border),
      );
      await tester.tap(starIcon);
      await tester.pump(const Duration(milliseconds: 100));
      expect(
        find.descendant(of: bitcoinCard, matching: find.byIcon(Icons.star)),
        findsOneWidget,
      );
      final marketTabButton = find.byKey(const Key('market-tab-button'));
      await tester.tap(marketTabButton);
      await tester.pump();
      expect(find.widgetWithText(Card, 'Bitcoin'), findsOneWidget);
    });
    testWidgets('should navigate to coin details when tapping on a coin card', (
      tester,
    ) async {
      when(
        () => goRouter.push(any<String>(), extra: any(named: 'extra')),
      ).thenAnswer((_) async => null);
      await loadHomeScreen(tester);
      await tester.pump();
      final marketTabButtonKey = find.byKey(const Key('market-tab-button'));
      await tester.tap(marketTabButtonKey);
      await tester.pumpAndSettle();
      final searchField = find.byKey(const Key('search-edit'));
      await tester.tap(searchField);
      await tester.pump();
      await tester.enterText(searchField, 'Bitcoin');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump(const Duration(milliseconds: 100));
      final bitcoinCard = find.widgetWithText(Card, 'Bitcoin');
      expect(bitcoinCard, findsOneWidget);
      await tester.tap(bitcoinCard);
      await tester.pump();
      verify(
        () => goRouter.push(any<String>(), extra: any(named: 'extra')),
      ).called(1);
    });
    // testWidgets('6', (
    //   tester,
    // ) async {
    //   when(
    //     () => goRouter.push(any<String>(), extra: any(named: 'extra')),
    //   ).thenAnswer((_) async => null);
    //   await loadHomeScreen(tester);
    //   await tester.pump();
    //   final marketTabButtonKey = find.byKey(const Key('market-tab-button'));
    //   await tester.tap(marketTabButtonKey);
    //   await tester.pumpAndSettle();
    //   final searchField = find.byKey(const Key('search-edit'));
    //   await tester.tap(searchField);
    //   await tester.pump();
    //   await tester.enterText(searchField, 'Bitcoin');
    //   await tester.testTextInput.receiveAction(TextInputAction.done);
    //   await tester.pump(const Duration(milliseconds: 100));
    //   final bitcoinCard = find.widgetWithText(Card, 'Bitcoin');
    //   expect(bitcoinCard, findsOneWidget);
    //   await tester.tap(bitcoinCard);
    //   await tester.pump(Durations.extralong4);
    //   verify(
    //     () => goRouter.push(any<String>(), extra: any(named: 'extra')),
    //   ).called(1);
    //   await tapAppBarBackButton(tester);
    // });
  });
}
