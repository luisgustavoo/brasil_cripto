import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/home/view_models/home_view_model.dart';
import 'package:brasil_cripto/ui/home/widgets/coins_card.dart';
import 'package:flutter/material.dart';

class TabCoins extends StatefulWidget {
  const TabCoins({
    required this.viewModel,
    super.key,
  });

  final HomeViewModel viewModel;

  @override
  State<TabCoins> createState() => _TabCoinsState();
}

class _TabCoinsState extends State<TabCoins> {
  HomeViewModel get viewModel => widget.viewModel;
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              listenable: widget.viewModel,
              builder: (context, child) {
                return _buildList(viewModel, locale);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(HomeViewModel viewModel, Locale locale) {
    return StreamBuilder(
      stream: viewModel.coinsMarketsStream,
      builder: (context, snapshot) {
        if (widget.viewModel.fetchCoinsMarkets.running) {
          return const Center(child: CircularProgressIndicator());
        }

        if (widget.viewModel.fetchCoinsMarkets.error) {
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
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final coin = snapshot.data![index];
              return CoinsCard(
                coinsMarkets: coin,
                locale: locale,
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  void _search() {
    final locale = Localizations.localeOf(context);
    final vsCurrency = locale.languageCode == 'pt' ? 'brl' : 'usd';
    viewModel.fetchCoinsMarkets.execute((
      names: searchController.text.toLowerCase(),
      vsCurrency: vsCurrency,
    ));
  }
}
