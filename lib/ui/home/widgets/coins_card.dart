import 'package:brasil_cripto/domain/models/coins_markets.dart';
import 'package:flutter/material.dart';

class CoinsCard extends StatelessWidget {
  const CoinsCard({
    required this.coinsMarkets,
    super.key,
  });

  final CoinsMarkets coinsMarkets;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(coinsMarkets.name),
        subtitle: Text(coinsMarkets.symbol),
        trailing: Text('R\$ ${coinsMarkets.currentPrice.toStringAsFixed(2)}'),
      ),
    );
  }
}
