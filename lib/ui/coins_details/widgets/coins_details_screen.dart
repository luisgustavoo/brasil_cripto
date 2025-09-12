import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/ui/coins_details/view_models/coins_details_view_model.dart';
import 'package:brasil_cripto/ui/coins_details/widgets/spark_line_details_chart.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/dimens.dart';
import 'package:flutter/material.dart';

class CoinsDetailsScreen extends StatefulWidget {
  const CoinsDetailsScreen({
    required this.coin,
    required this.viewModel,
    super.key,
  });

  final Coin coin;
  final CoinsDetailsViewModel viewModel;

  @override
  State<CoinsDetailsScreen> createState() => _CoinsDetailsScreenState();
}

class _CoinsDetailsScreenState extends State<CoinsDetailsScreen> {
  CoinsDetailsViewModel get viewModel => widget.viewModel;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locale = Localizations.localeOf(context);
      final vsCurrency = locale.languageCode == 'pt' ? 'brl' : 'usd';
      viewModel.fetchCoinsMarketsDetails.execute(
        (
          id: widget.coin.id,
          vsCurrency: vsCurrency,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.coin.name),
      ),
      body: Padding(
        padding: context.dimens.edgeInsetsScreenSymmetric,
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            if (viewModel.fetchCoinsMarketsDetails.running) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.fetchCoinsMarketsDetails.error) {
              return Center(
                child: Text(
                  context.l10n.errorLoadingData,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (viewModel.market == null) {
              return const SizedBox.shrink();
            }

            return SparkLineDetailsChart(
              coin: widget.coin,
              market: viewModel.market!,
              locale: locale,
            );
          },
        ),
      ),
    );
  }
}
