import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/dimens.dart';
import 'package:brasil_cripto/ui/home/view_models/home_view_model.dart';
import 'package:brasil_cripto/ui/home/widgets/tab_coins.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.l10n.brazilCripto,
            // style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar.secondary(
            tabs: [
              Tab(icon: Icon(Icons.monitor_heart_outlined)),
              Tab(icon: Icon(Icons.star_outline)),
            ],
          ),
        ),
        body: Padding(
          padding: context.dimens.edgeInsetsScreenSymmetric,
          child: TabBarView(
            children: [
              TabCoins(
                viewModel: viewModel,
              ),
              const Icon(Icons.favorite),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _search,
          child: const Icon(Icons.refresh),
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
