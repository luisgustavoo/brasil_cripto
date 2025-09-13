import 'package:brasil_cripto/config/dependencies.dart';
import 'package:brasil_cripto/routing/router.dart';
import 'package:brasil_cripto/ui/coins_markets/widgets/coins_card.dart';
import 'package:brasil_cripto/ui/core/l10n/app_localizations.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/theme.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  late AppLocalizations l10n;

  Future<void> loadHomeScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: Router.router,
        locale: const Locale('pt', 'BR'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.lightTheme,
        builder: (context, child) {
          l10n = context.l10n;
          return child!;
        },
      ),
    );
    await tester.pumpAndSettle();
  }

  group('end-to-end test', () {
    testWidgets('should display title and empty state', (tester) async {
      await loadHomeScreen(tester);
      expect(find.text(l10n.brazilCripto), findsOneWidget);
      expect(find.text(l10n.noCryptocurrencyFound), findsOneWidget);
    });
    testWidgets(
      'should search for a coin and display result',
      (tester) async {
        await loadHomeScreen(tester);
        final marketTabButton = find.byKey(const Key('market-tab-button'));
        await tester.tap(marketTabButton);
        await tester.pumpAndSettle();
        final searchField = find.byKey(const Key('search-edit'));
        await tester.tap(searchField);
        await tester.pumpAndSettle();
        await tester.showKeyboard(searchField);
        await tester.enterText(searchField, 'Bitcoin');
        await tester.pumpAndSettle();
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pumpAndSettle();
        expect(find.text('(BTC)'), findsOneWidget);
      },
    );

    testWidgets(
      'should search for Bitcoin and favorite it',
      (tester) async {
        await loadHomeScreen(tester);
        final marketTabButtonKey = find.byKey(const Key('market-tab-button'));
        await tester.tap(marketTabButtonKey);
        await tester.pumpAndSettle();
        final searchField = find.byKey(const Key('search-edit'));
        await tester.tap(searchField);
        await tester.pumpAndSettle();
        await tester.enterText(searchField, 'Bitcoin');
        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump(const Duration(milliseconds: 100));
        final starIcon = find.byIcon(Icons.star_border).at(0);
        await tester.tap(starIcon);
        await tester.pump(const Duration(milliseconds: 100));
        expect(find.byIcon(Icons.star).at(0), findsOneWidget);
        final marketTabButton = find.byKey(const Key('market-tab-button'));
        await tester.tap(marketTabButton);
        await tester.pump();
        expect(find.text('(BTC)'), findsOneWidget);
      },
    );
    testWidgets(
      'should navigate to coin details when tapping on a coin card',
      (
        tester,
      ) async {
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
        await tester.pumpAndSettle();
        final bitcoinCard = find.byType(CoinsCard);
        expect(bitcoinCard, findsOneWidget);
        await tester.tap(bitcoinCard);
        await tester.pumpAndSettle();
      },
    );
  });
}
