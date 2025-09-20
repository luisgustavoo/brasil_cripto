import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/routing/routes.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/ui/coins_card.dart';
import 'package:brasil_cripto/ui/home/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeFavoriteCoinsMarketTab extends StatefulWidget {
  const HomeFavoriteCoinsMarketTab({
    required this.viewModel,
    super.key,
  });

  final HomeViewModel viewModel;

  @override
  State<HomeFavoriteCoinsMarketTab> createState() =>
      _HomeFavoriteCoinsMarketTabState();
}

class _HomeFavoriteCoinsMarketTabState extends State<HomeFavoriteCoinsMarketTab>
    with AutomaticKeepAliveClientMixin {
  HomeViewModel get viewModel => widget.viewModel;
  String vsCurrency = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final locale = Localizations.localeOf(context);
        vsCurrency = locale.languageCode == 'pt' ? 'brl' : 'usd';
        viewModel.getFavorites.execute(vsCurrency);
      },
    );
  }

  Future<void> _toggleFavorites(Coin coin) async {
    await viewModel.toggleFavorite.execute(coin);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        final favoriteCoins = widget.viewModel.favoriteCoins;
        if (viewModel.getFavorites.running) {
          return const _LoadingState();
        }
        if (viewModel.getFavorites.error) {
          return _ErrorState(message: context.l10n.errorLoadingData);
        }
        if (favoriteCoins.isEmpty) {
          return _EmptyState(message: context.l10n.noCryptocurrencyFound);
        }
        return _CoinsList(
          coins: favoriteCoins,
          onTap: (coin) {
            context.push(Routes.coinsDetails, extra: coin);
          },
          onToggleFavorite: _toggleFavorites,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) => Center(
    child: Text(
      message,
      style: const TextStyle(color: Colors.grey),
    ),
  );
}

class _CoinsList extends StatelessWidget {
  const _CoinsList({
    required this.coins,
    required this.onToggleFavorite,
    required this.onTap,
  });

  final List<Coin> coins;
  final void Function(Coin coin) onToggleFavorite;
  final void Function(Coin coin) onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return CoinsCard(
          coin: coin,
          toggleFavorite: onToggleFavorite,
          onTap: onTap,
        );
      },
    );
  }
}
