import 'package:brasil_cripto/config/dependencies.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/routing/routes.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/ui/coins_card.dart';
import 'package:brasil_cripto/ui/favorites/view_models/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    required this.viewModel,
    super.key,
  });

  final FavoriteViewModel viewModel;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with AutomaticKeepAliveClientMixin {
  FavoriteViewModel get viewModel => widget.viewModel;
  bool _isLoading = false;
  bool _hasError = false;
  String vsCurrency = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final locale = Localizations.localeOf(context);
        vsCurrency = locale.languageCode == 'pt' ? 'brl' : 'usd';
        viewModel.getFavorites.execute(vsCurrency);
        viewModel.getFavorites.addListener(_commandListener);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.getFavorites.removeListener(_commandListener);
  }

  void _commandListener() {
    if (!mounted) {
      return;
    }
    setState(() {
      _isLoading = viewModel.getFavorites.running;
      _hasError = viewModel.getFavorites.error;
    });
  }

  Future<void> _toggleFavorites(Coin coin) async {
    await getIt<FavoriteViewModel>().toggleFavorite.execute(coin.name);
    await getIt<FavoriteViewModel>().getFavorites.execute(vsCurrency);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox.shrink();
    // return ListenableBuilder(
    //   listenable: widget.viewModel,
    //   builder: (context, child) {
    //     final coins = widget.viewModel.favoriteCoins;
    //     if (_isLoading) {
    //       return const _LoadingState();
    //     }
    //     if (_hasError) {
    //       return _ErrorState(message: context.l10n.errorLoadingData);
    //     }
    //     if (coins.isEmpty) {
    //       return _EmptyState(message: context.l10n.noCryptocurrencyFound);
    //     }
    //     return _CoinsList(
    //       coins: coins,
    //       onTap: (coin) {
    //         context.push(Routes.coinsDetails, extra: coin);
    //       },
    //       onToggleFavorite: _toggleFavorites,
    //     );
    //   },
    // );
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
    final favoriteViewModel = getIt<FavoriteViewModel>();
    return ListenableBuilder(
      listenable: favoriteViewModel.getFavorites,
      builder: (context, child) {
        return ListView.builder(
          itemCount: coins.length,
          itemBuilder: (context, index) {
            final coin = coins[index];
            return CoinsCard(
              coin: coin,
              isFavorite: coin.isFavorite,
              toggleFavorite: onToggleFavorite,
              onTap: onTap,
            );
          },
        );
      },
    );
  }
}
