import 'package:brasil_cripto/config/dependencies.dart';
import 'package:brasil_cripto/routing/router.dart';
import 'package:brasil_cripto/ui/core/l10n/app_localizations.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/theme.dart';
import 'package:brasil_cripto/ui/core/ui/coins_card.dart';
import 'package:brasil_cripto/ui/home/widgets/home_coins_market_tab.dart';
import 'package:brasil_cripto/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  late AppLocalizations l10n;

  Future<void> clearPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  setUpAll(clearPrefs);

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

          return child ?? const SizedBox.shrink();
        },
      ),
    );
    await tester.pumpAndSettle();
  }

  group('end-to-end test', () {
    testWidgets('should navigate to coin details after search', (tester) async {
      await loadHomeScreen(tester);
      final marketTab = find.byKey(const Key(marketTabKey));
      await tester.tap(marketTab);
      await tester.pumpAndSettle();
      final searchField = find.byKey(const Key(searchEditKey));
      await tester.tap(searchField);
      await tester.pumpAndSettle();
      await tester.showKeyboard(searchField);
      await tester.enterText(searchField, 'Bitcoin');
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.text('(BTC)'), findsOneWidget);
      final bitcoinCard = find.byType(CoinsCard);
      expect(bitcoinCard, findsOneWidget);
      await tester.tap(bitcoinCard);
      await tester.pumpAndSettle();
      final backButton = find.byType(BackButton);
      await tester.tap(backButton);
      await tester.pumpAndSettle();
    });
    testWidgets('should search for Bitcoin and favorite it', (tester) async {
      // Pesquisa o item
      await loadHomeScreen(tester);
      final marketTab = find.byKey(const Key(marketTabKey));
      await tester.tap(marketTab);
      await tester.pumpAndSettle();
      final searchField = find.byKey(const Key(searchEditKey));
      await tester.tap(searchField);
      await tester.pumpAndSettle();
      await tester.showKeyboard(searchField);
      await tester.enterText(searchField, 'Bitcoin');
      await tester.pumpAndSettle();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(find.text('(BTC)'), findsOneWidget);
      // Favorita o item
      final starBorderIcon = find.byKey(const Key('favorite-icon-bitcoin'));
      await tester.tap(starBorderIcon);
      await tester.pumpAndSettle();
      final favoriteTab = find.byKey(const Key(favoriteTabKey));
      await tester.tap(favoriteTab);
      await tester.pumpAndSettle();
      final starIcon = find.byIcon(Icons.star);
      expect(starIcon, findsOneWidget);
    });
    testWidgets('remove favorite', (tester) async {
      await loadHomeScreen(tester);
      final starIcon = find.byKey(const Key('favorite-icon-bitcoin'));
      expect(starIcon, findsOneWidget);
      await tester.tap(starIcon);
      await tester.pumpAndSettle();
      expect(find.text(l10n.confirmRemoveTitle), findsOneWidget);
      final removeButton = find.text(l10n.remove);
      await tester.tap(removeButton);
      await tester.pumpAndSettle();
      expect(find.text(l10n.noCryptocurrencyFound), findsOneWidget);
    });
  });
}
