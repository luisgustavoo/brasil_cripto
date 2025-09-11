import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/dimens.dart';
import 'package:brasil_cripto/ui/home/view_models/home_view_model.dart';
import 'package:brasil_cripto/ui/home/widgets/coins_card.dart';
import 'package:flutter/material.dart';

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
  HomeViewModel get viewModel => widget.viewModel;
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.brazilCripto,
          // style: TextStyle(color: Colors.white),
        ),
      ),
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
                listenable: viewModel,
                builder: (context, child) {
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

                  if (viewModel.coinsMarkets.isEmpty) {
                    return Center(
                      child: Text(
                        context.l10n.noCryptocurrencyFound,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: viewModel.coinsMarkets.length,
                    itemBuilder: (context, index) {
                      final coin = viewModel.coinsMarkets[index];
                      return CoinsCard(
                        coinsMarkets: coin,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _search,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _search() {
    if (searchController.text.isNotEmpty) {
      viewModel.fetchCoinsMarkets.execute(searchController.text);
    }
  }
}
