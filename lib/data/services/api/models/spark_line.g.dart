// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spark_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparkLine _$SparkLineFromJson(Map<String, dynamic> json) => SparkLine(
  price: (json['price'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
);

Map<String, dynamic> _$SparkLineToJson(SparkLine instance) => <String, dynamic>{
  'price': instance.price,
};
