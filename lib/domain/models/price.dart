import 'package:freezed_annotation/freezed_annotation.dart';

part 'price.freezed.dart';

@freezed
abstract class Price with _$Price {
  const factory Price({
    required int timestamp,
    required double value,
  }) = _Price;
}
