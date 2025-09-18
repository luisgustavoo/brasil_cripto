// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spark_line_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SparkLineApiModel _$SparkLineApiModelFromJson(Map<String, dynamic> json) =>
    _SparkLineApiModel(
      price: (json['price'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$SparkLineApiModelToJson(_SparkLineApiModel instance) =>
    <String, dynamic>{'price': instance.price};
