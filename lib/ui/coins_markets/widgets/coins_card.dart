import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/ui/coins_markets/widgets/coins_market_summary.dart';
import 'package:brasil_cripto/ui/coins_markets/widgets/spark_line_chart.dart';
import 'package:brasil_cripto/ui/core/themes/dimens.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoinsCard extends StatelessWidget {
  const CoinsCard({
    required this.coin,
    required this.locale,
    this.toggleFavorite,
    super.key,
  });

  final Coin coin;
  final Locale locale;
  final void Function(Coin coin)? toggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: context.dimens.edgeInsetsScreenSymmetric16dp,
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.star_border),
              // color: Colors.yellow,
              onPressed: () {
                toggleFavorite?.call(coin);
              },
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                        imageUrl: coin.image,
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
                      Expanded(
                        child: Text(
                          coin.name,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '(${coin.symbol.toUpperCase()})',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  CoinsMarketSummary(
                    coinsMarkets: coin,
                    locale: locale,
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SizedBox(
                        height: 100,
                        width: constraints.maxWidth,
                        child: SparkLineChart(coinsMarkets: coin),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
