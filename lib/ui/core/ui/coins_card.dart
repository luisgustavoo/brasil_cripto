import 'package:brasil_cripto/config/dependencies.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/ui/coins_markets/widgets/spark_line_chart.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/themes/dimens.dart';
import 'package:brasil_cripto/ui/core/ui/coins_market_summary.dart';
import 'package:brasil_cripto/ui/core/ui/confirm_remove_favorite_dialog.dart';
import 'package:brasil_cripto/ui/favorites/view_models/favorite_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CoinsCard extends StatelessWidget {
  const CoinsCard({
    required this.coin,
    this.toggleFavorite,
    this.onTap,
    super.key,
  });

  final Coin coin;
  final void Function(Coin coin)? toggleFavorite;
  final void Function(Coin coin)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call(coin);
      },
      child: Card(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          padding: context.dimens.edgeInsetsScreenSymmetric16dp,
          width: MediaQuery.sizeOf(context).width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListenableBuilder(
                listenable: getIt<FavoriteViewModel>().toggleFavorite,
                builder: (context, child) {
                  return IconButton(
                    key: Key('favorite-icon-${coin.id}'),
                    icon: isFavorite(coin)
                        ? const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          )
                        : const Icon(Icons.star_border),
                    onPressed: () async {
                      final isFav = isFavorite(coin);
                      if (!isFav) {
                        toggleFavorite?.call(coin);
                        return;
                      }

                      final confirmed = await showConfirmRemoveFavoriteDialog(
                        context: context,
                        coinName: coin.name,
                        title: context.l10n.confirmRemoveTitle,
                        confirmLabel: context.l10n.remove,
                        cancelLabel: context.l10n.cancel,
                      );

                      if (confirmed ?? false) {
                        toggleFavorite?.call(coin);
                      }
                    },
                  );
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
                      coin: coin,
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
      ),
    );
  }

  bool isFavorite(Coin coin) {
    final favorites = getIt<FavoriteViewModel>().favorites;

    final favorito = favorites.firstWhereOrNull(
      (element) => element.id == coin.id,
    );

    return favorito != null;
  }
}
