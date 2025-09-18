import 'package:freezed_annotation/freezed_annotation.dart';

part 'market.freezed.dart';

@freezed
abstract class Market with _$Market {
  const factory Market({
    required List<List<double>> prices,
    required List<List<double>> marketCaps,
    required List<List<double>> totalVolumes,
  }) = _Market;
}
