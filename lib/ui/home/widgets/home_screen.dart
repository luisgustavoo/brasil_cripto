import 'package:brasil_cripto/config/dependencies.dart';
import 'package:brasil_cripto/ui/coins_markets/widgets/coins_market_screen.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/dimens.dart';
import 'package:brasil_cripto/ui/favorites/view_models/favorite_view_model.dart';
import 'package:brasil_cripto/ui/favorites/widgets/favorite_screen.dart';
import 'package:flutter/material.dart';

const String favoriteTabKey = 'favorite-tab-key';
const String marketTabKey = 'market-tab-key';

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
          bottom: const TabBar(
            tabs: [
              Tab(
                key: Key(favoriteTabKey),
                icon: Icon(Icons.star_outline),
              ),
              Tab(
                key: Key(marketTabKey),
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
                viewModel: getIt<FavoriteViewModel>(),
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
