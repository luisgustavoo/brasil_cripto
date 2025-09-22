// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PriceApiModel _$PriceApiModelFromJson(Map<String, dynamic> json) =>
    _PriceApiModel(
      timestamp: (json['timestamp'] as num).toInt(),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$PriceApiModelToJson(_PriceApiModel instance) =>
    <String, dynamic>{'timestamp': instance.timestamp, 'value': instance.value};
