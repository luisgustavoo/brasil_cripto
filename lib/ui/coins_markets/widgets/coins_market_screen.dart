import 'package:brasil_cripto/config/dependencies.dart';
import 'package:brasil_cripto/routing/routes.dart';
import 'package:brasil_cripto/ui/coins_markets/view_models/coins_markets_view_model.dart';
import 'package:brasil_cripto/ui/coins_markets/widgets/coins_card.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/favorites/view_models/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    viewModel.closeBackgroundService.execute();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final locale = Localizations.localeOf(context);
    return Scaffold(
      body: Column(
        spacing: 32,
        children: [
          TextField(
            controller: searchController,
            // autofocus: true,
            decoration: InputDecoration(
              labelText: context.l10n.search,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  searchController.clear();
                },
              ),
            ),
            onSubmitted: (value) {
              _search();
            },
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: Listenable.merge([
                widget.viewModel,
                getIt<FavoriteViewModel>().toggleFavorite,
              ]),
              builder: (context, child) {
                return _buildList(viewModel, locale);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(CoinsMarketViewModel viewModel, Locale locale) {
    return StreamBuilder(
      stream: viewModel.coinsMarketsStream,
      builder: (context, snapshot) {
        if (viewModel.fetchCoinsMarkets.running) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.fetchCoinsMarkets.error) {
          return Center(
            child: Text(
              context.l10n.errorLoadingData,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        if (!snapshot.hasData) {
          return Center(
            child: Text(
              context.l10n.noCryptocurrencyFound,
              style: const TextStyle(color: Colors.grey),
            ),
          );
        }

        if (snapshot.hasData) {
          return RefreshIndicator(
            onRefresh: _search,
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final coin = snapshot.data![index];
                return CoinsCard(
                  coin: coin,
                  locale: locale,
                  toggleFavorite: (coin) {
                    getIt<FavoriteViewModel>().toggleFavorite.execute(coin);
                  },
                  onTap: (coin) {
                    context.push(
                      Routes.coinsDetails,
                      extra: coin,
                    );
                  },
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Future<void> _search() async {
    final locale = Localizations.localeOf(context);
    final vsCurrency = locale.languageCode == 'pt' ? 'brl' : 'usd';
    await viewModel.fetchCoinsMarkets.execute((
      names: searchController.text.toLowerCase(),
      vsCurrency: vsCurrency,
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
