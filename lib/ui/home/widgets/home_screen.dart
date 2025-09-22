import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/dimens.dart';
import 'package:brasil_cripto/ui/home/view_models/home_view_model.dart';
import 'package:brasil_cripto/ui/home/widgets/home_coins_market_tab.dart';
import 'package:brasil_cripto/ui/home/widgets/home_favorite_coins_market_tab.dart';
import 'package:flutter/material.dart';

const String favoriteTabKey = 'favorite-tab-key';
const String marketTabKey = 'market-tab-key';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.viewModel,
    super.key,
  });

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    widget.viewModel.vsCurrency = locale.languageCode == 'pt' ? 'brl' : 'usd';

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.brazilCripto,
          ),
          bottom: TabBar(
            onTap: (index) {
              if (index == 0) {
                FocusScope.of(context).unfocus();
              }
            },
            tabs: const [
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
              HomeFavoriteCoinsMarketTab(
                viewModel: widget.viewModel,
              ),
              HomeCoinsMarketTab(
                viewModel: widget.viewModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
