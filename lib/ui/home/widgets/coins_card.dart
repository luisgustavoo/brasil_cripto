import 'package:brasil_cripto/domain/models/coins_markets.dart';
import 'package:brasil_cripto/ui/core/themes/colors.dart';
import 'package:brasil_cripto/ui/core/themes/dimens.dart';
import 'package:brasil_cripto/ui/home/widgets/spark_line_chart.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinsCard extends StatelessWidget {
  const CoinsCard({
    required this.coinsMarkets,
    required this.locale,
    super.key,
  });

  final CoinsMarkets coinsMarkets;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      padding: context.dimens.edgeInsetsScreenSymmetric16dp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.darkCard,
      ),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        spacing: 16,
        children: [
          Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          Column(
            children: [
              Row(
                spacing: 8,
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 30,
                    width: 30,
                    imageUrl: coinsMarkets.image,
                    placeholder: (context, url) => const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 0.5,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),

                  Text(
                    coinsMarkets.name,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Text(
                    '(${coinsMarkets.symbol.toUpperCase()})',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Text(
                _formatarValor(coinsMarkets.currentPrice),
              ),
              SizedBox(
                width: 100,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      height: 75,
                      width: constraints.maxWidth,
                      child: SparkLineChart(coinsMarkets: coinsMarkets),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatarValor(double valor) {
    // final symbol = locale.languageCode == 'pt' ? r'R$' : r'US$';
    return NumberFormat.currency(
      locale: locale.languageCode,
      // symbol: symbol,
      // Se preferir deixar que o Intl escolha o símbolo padrão, pode omitir `symbol`
    ).format(valor);
  }
}
