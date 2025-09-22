// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coins_markets_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoinsMarketsApiModel _$CoinsMarketsApiModelFromJson(
  Map<String, dynamic> json,
) => _CoinsMarketsApiModel(
  id: json['id'] as String,
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  currentPrice: (json['current_price'] as num).toDouble(),
  marketCap: (json['market_cap'] as num).toDouble(),
  marketCapRank: (json['market_cap_rank'] as num).toInt(),
  sparkLineIn7d: SparkLineApiModel.fromJson(
    json['sparkline_in_7d'] as Map<String, dynamic>,
  ),
  priceChangePercentage1hInCurrency:
      (json['price_change_percentage_1h_in_currency'] as num).toDouble(),
  priceChangePercentage24hInCurrency:
      (json['price_change_percentage_24h_in_currency'] as num).toDouble(),
  priceChangePercentage7dInCurrency:
      (json['price_change_percentage_7d_in_currency'] as num).toDouble(),
  totalVolume: (json['total_volume'] as num).toDouble(),
  fullyDilutedValuation: (json['fully_diluted_valuation'] as num?)?.toDouble(),
  high24h: (json['high24h'] as num?)?.toDouble(),
  low24h: (json['low24h'] as num?)?.toDouble(),
  priceChange24h: (json['price_change24h'] as num?)?.toDouble(),
  priceChangePercentage24h: (json['price_change_percentage24h'] as num?)
      ?.toDouble(),
  marketCapChange24h: (json['market_cap_change24h'] as num?)?.toDouble(),
  marketCapChangePercentage24h:
      (json['market_cap_change_percentage24h'] as num?)?.toDouble(),
  circulatingSupply: (json['circulating_supply'] as num?)?.toDouble(),
  totalSupply: (json['total_supply'] as num?)?.toDouble(),
  maxSupply: (json['max_supply'] as num?)?.toDouble(),
  ath: (json['ath'] as num?)?.toDouble(),
  athChangePercentage: (json['ath_change_percentage'] as num?)?.toDouble(),
  athDate: json['ath_date'] as String?,
  atl: (json['atl'] as num?)?.toDouble(),
  atlChangePercentage: (json['atl_change_percentage'] as num?)?.toDouble(),
  atlDate: json['atl_date'] as String?,
  roi: json['roi'],
  lastUpdated: json['last_updated'] as String?,
);

Map<String, dynamic> _$CoinsMarketsApiModelToJson(
  _CoinsMarketsApiModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'symbol': instance.symbol,
  'name': instance.name,
  'image': instance.image,
  'current_price': instance.currentPrice,
  'market_cap': instance.marketCap,
  'market_cap_rank': instance.marketCapRank,
  'sparkline_in_7d': instance.sparkLineIn7d.toJson(),
  'price_change_percentage_1h_in_currency':
      instance.priceChangePercentage1hInCurrency,
  'price_change_percentage_24h_in_currency':
      instance.priceChangePercentage24hInCurrency,
  'price_change_percentage_7d_in_currency':
      instance.priceChangePercentage7dInCurrency,
  'total_volume': instance.totalVolume,
  'fully_diluted_valuation': instance.fullyDilutedValuation,
  'high24h': instance.high24h,
  'low24h': instance.low24h,
  'price_change24h': instance.priceChange24h,
  'price_change_percentage24h': instance.priceChangePercentage24h,
  'market_cap_change24h': instance.marketCapChange24h,
  'market_cap_change_percentage24h': instance.marketCapChangePercentage24h,
  'circulating_supply': instance.circulatingSupply,
  'total_supply': instance.totalSupply,
  'max_supply': instance.maxSupply,
  'ath': instance.ath,
  'ath_change_percentage': instance.athChangePercentage,
  'ath_date': instance.athDate,
  'atl': instance.atl,
  'atl_change_percentage': instance.atlChangePercentage,
  'atl_date': instance.atlDate,
  'roi': instance.roi,
  'last_updated': instance.lastUpdated,
};
