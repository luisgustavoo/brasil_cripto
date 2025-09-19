import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/routing/routes.dart';
import 'package:brasil_cripto/ui/coins_markets/view_models/coins_markets_view_model.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/ui/coins_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String searchEditKey = 'search-edit-key';

class CoinsMarketScreen extends StatefulWidget {
  const CoinsMarketScreen({required this.viewModel, super.key});

  final CoinsMarketViewModel viewModel;

  @override
  State<CoinsMarketScreen> createState() => _CoinsMarketScreenState();
}

class _CoinsMarketScreenState extends State<CoinsMarketScreen>
    with AutomaticKeepAliveClientMixin {
  CoinsMarketViewModel get viewModel => widget.viewModel;
  late final TextEditingController searchController;
  bool isLoading = false;
  bool hasError = false;
  String vsCurrency = '';

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    viewModel.fetchCoinsMarkets.addListener(_commandListener);
  }

  void _commandListener() {
    if (!mounted) {
      return;
    }
    setState(() {
      isLoading = viewModel.fetchCoinsMarkets.running;
      hasError = viewModel.fetchCoinsMarkets.error;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    viewModel.fetchCoinsMarkets.removeListener(_commandListener);
    super.dispose();
  }

  Future<void> _search() async {
    await viewModel.fetchCoinsMarkets.execute(
      (
        names: searchController.text.toLowerCase(),
        vsCurrency: vsCurrency,
      ),
    );
  }

  void _toggleFavorites(Coin coin) {
    viewModel.toggleFavorite.execute(coin);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final locale = Localizations.localeOf(context);
    vsCurrency = locale.languageCode == 'pt' ? 'brl' : 'usd';
    return Scaffold(
      body: Column(
        spacing: 32,
        children: [
          _SearchField(
            controller: searchController,
            onSubmitted: (value) {
              _search();
            },
          ),
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        final coins = viewModel.coins;
        if (isLoading) {
          return const _LoadingState();
        }
        if (hasError) {
          return _ErrorState(message: context.l10n.errorLoadingData);
        }
        if (coins.isEmpty) {
          return _EmptyState(message: context.l10n.noCryptocurrencyFound);
        }
        return _CoinsList(
          viewModel: viewModel,
          coins: coins,
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
    required this.viewModel,
  });

  final List<Coin> coins;
  final CoinsMarketViewModel viewModel;

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
          isFavorite: coin.isFavorite,
          toggleFavorite: onToggleFavorite,
          onTap: onTap,
        );
      },
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final void Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) => TextField(
    key: const Key(searchEditKey),
    controller: controller,
    decoration: InputDecoration(
      labelText: context.l10n.search,
      border: const OutlineInputBorder(),
      suffixIcon: IconButton(
        icon: const Icon(Icons.clear),
        onPressed: controller.clear,
      ),
    ),
    onSubmitted: onSubmitted,
  );
}
