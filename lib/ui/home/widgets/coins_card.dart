import 'package:brasil_cripto/domain/models/coins_markets.dart';
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
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        title: Expanded(
          child: Row(
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
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),

              Text(coinsMarkets.name),

              Text(
                '(${coinsMarkets.symbol.toUpperCase()})',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        subtitle: Text(_formatarValor(coinsMarkets.currentPrice)),
      ),
    );
  }

  String _formatarValor(double valor) {
    return NumberFormat.currency(
      locale: locale.languageCode,
      // Se preferir deixar que o Intl escolha o símbolo padrão, pode omitir `symbol`
    ).format(valor);
  }
}
