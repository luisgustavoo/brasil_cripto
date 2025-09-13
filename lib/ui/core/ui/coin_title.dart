import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoinTitle extends StatelessWidget {
  const CoinTitle({
    required this.coin,
    this.imageSize = 30.0,
    super.key,
  });

  final Coin coin;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        CachedNetworkImage(
          imageUrl: coin.image,
          height: imageSize,
          width: imageSize,
          fit: BoxFit.cover,
          placeholder: (context, url) => SizedBox(
            height: imageSize,
            width: imageSize,
            child: const CircularProgressIndicator(
              strokeWidth: 0.5,
            ),
          ),
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: imageSize,
          ),
        ),
        Expanded(
          child: Text(
            coin.name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Text(
          '(${coin.symbol.toUpperCase()})',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
