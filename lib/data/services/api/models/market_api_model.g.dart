// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketApiModel _$MarketApiModelFromJson(Map<String, dynamic> json) =>
    MarketApiModel(
      prices: (json['prices'] as List<dynamic>)
          .map((e) => PriceApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      marketCaps: (json['market_caps'] as List<dynamic>)
          .map((e) => PriceApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalVolumes: (json['total_volumes'] as List<dynamic>)
          .map((e) => PriceApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MarketApiModelToJson(MarketApiModel instance) =>
    <String, dynamic>{
      'prices': instance.prices,
      'market_caps': instance.marketCaps,
      'total_volumes': instance.totalVolumes,
    };
