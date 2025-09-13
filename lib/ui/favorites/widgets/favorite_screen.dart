import 'package:brasil_cripto/routing/routes.dart';
import 'package:brasil_cripto/ui/core/l10n/l10n.dart';
import 'package:brasil_cripto/ui/core/ui/coins_card.dart';
import 'package:brasil_cripto/ui/favorites/view_models/favorite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    required this.viewModel,
    super.key,
  });

  final FavoriteViewModel viewModel;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          if (widget.viewModel.getFavorites.running) {
            return const Center(child: CircularProgressIndicator());
          }

          if (widget.viewModel.getFavorites.error) {
            return Center(
              child: Text(
                context.l10n.errorLoadingData,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (widget.viewModel.favorites.isEmpty) {
            return Center(
              child: Text(
                context.l10n.noCryptocurrencyFound,
                style: const TextStyle(color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: widget.viewModel.favorites.length,
            itemBuilder: (context, index) {
              final coin = widget.viewModel.favorites[index];
              return CoinsCard(
                coin: coin,

                toggleFavorite: (coin) {
                  widget.viewModel.toggleFavorite.execute(coin);
                },
                onTap: (coin) {
                  context.push(
                    Routes.coinsDetails,
                    extra: coin,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
