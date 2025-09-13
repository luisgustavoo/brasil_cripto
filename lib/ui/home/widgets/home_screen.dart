import 'package:brasil_cripto/config/dependencies.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/dimens.dart';
import 'package:brasil_cripto/ui/core/ui/coins_market_screen.dart';
import 'package:brasil_cripto/ui/favorites/widgets/favorite_screen.dart';

import 'package:flutter/material.dart';

const String favoriteTabButtonKey = 'favorite-tab-button';
const String marketTabButtonKey = 'market-tab-button';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.brazilCripto,
          ),
          bottom: const TabBar.secondary(
            tabs: [
              Tab(
                key: Key(favoriteTabButtonKey),
                icon: Icon(Icons.star_outline),
              ),
              Tab(
                key: Key(marketTabButtonKey),
                icon: Icon(Icons.monitor_heart_outlined),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: context.dimens.edgeInsetsScreenSymmetric,
          child: TabBarView(
            children: [
              FavoriteScreen(
                viewModel: getIt(),
              ),
              CoinsMarketScreen(
                viewModel: getIt(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
