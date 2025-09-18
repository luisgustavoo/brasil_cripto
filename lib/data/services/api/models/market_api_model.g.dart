// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MarketApiModel _$MarketApiModelFromJson(Map<String, dynamic> json) =>
    _MarketApiModel(
      prices: (json['prices'] as List<dynamic>)
          .map(
            (e) =>
                (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
          )
          .toList(),
      marketCaps: (json['market_caps'] as List<dynamic>)
          .map(
            (e) =>
                (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
          )
          .toList(),
      totalVolumes: (json['total_volumes'] as List<dynamic>)
          .map(
            (e) =>
                (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
          )
          .toList(),
    );

Map<String, dynamic> _$MarketApiModelToJson(_MarketApiModel instance) =>
    <String, dynamic>{
      'prices': instance.prices,
      'market_caps': instance.marketCaps,
      'total_volumes': instance.totalVolumes,
    };
