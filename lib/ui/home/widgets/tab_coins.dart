import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/dimens.dart';
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
      body: Padding(
        padding: context.dimens.edgeInsetsScreenSymmetric,
        child: Column(
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

                  if (widget.viewModel.coinsMarkets.isEmpty) {
                    return Center(
                      child: Text(
                        context.l10n.noCryptocurrencyFound,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: widget.viewModel.coinsMarkets.length,
                    itemBuilder: (context, index) {
                      final coin = widget.viewModel.coinsMarkets[index];
                      return CoinsCard(
                        coinsMarkets: coin,
                        locale: locale,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
