// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spark_line_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparkLineApiModel _$SparkLineApiModelFromJson(Map<String, dynamic> json) =>
    SparkLineApiModel(
      price: (json['price'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$SparkLineApiModelToJson(SparkLineApiModel instance) =>
    <String, dynamic>{'price': instance.price};
