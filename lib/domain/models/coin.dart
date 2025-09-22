import 'package:brasil_cripto/domain/models/sparkline.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin.freezed.dart';

@freezed
abstract class Coin with _$Coin {
  const factory Coin({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required double currentPrice,
    required double marketCap,
    required int marketCapRank,
    required double totalVolume,
    required Sparkline sparkLineIn7d,
    required double priceChangePercentage1hInCurrency,
    required double priceChangePercentage24hInCurrency,
    required double priceChangePercentage7dInCurrency,
    @Default(false) bool isFavorite,
  }) = _Coin;
}
