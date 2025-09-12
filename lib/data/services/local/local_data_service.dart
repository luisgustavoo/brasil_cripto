import 'dart:convert';
import 'dart:developer';

import 'package:brasil_cripto/data/services/api/models/spark_line.dart';
import 'package:brasil_cripto/data/services/shared_preferences_service.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocalDataService {
  LocalDataService(SharedPreferencesService sharedPreferences)
    : _sharedPreferences = sharedPreferences;

  final SharedPreferencesService _sharedPreferences;

  Future<Result<void>> addFavorite(List<Map<String, dynamic>> coins) async {
    try {
      final result = await _sharedPreferences.setData(jsonEncode(coins));

      switch (result) {
        case Ok<void>():
          return result;
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      log('Erro ao adicionar favorito', error: e);
      return Result.error(e);
    }
  }

  Future<Result<List<Coin>>> getFavorites() async {
    try {
      final result = await _sharedPreferences.getData();
      switch (result) {
        case Ok<String?>():
          final value = result.value;
          if (value?.isEmpty ?? true) {
            return const Result.ok([]);
          }

          final coinsJson = jsonDecode(value!) as List<dynamic>;
          final coinsMap = List<Map<String, dynamic>>.from(coinsJson);
          final coins = coinsMap.map(fromMap).toList();
          return Result.ok(coins);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Coin fromMap(Map<String, dynamic> map) {
    return Coin(
      id: map['id'] as String,
      symbol: map['symbol'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      currentPrice: (map['current_price'] as num).toDouble(),
      marketCap: (map['market_cap'] as num).toDouble(),
      marketCapRank: map['market_cap_rank'] as int,
      fullyDilutedValuation:
          (map['fully_diluted_valuation'] as num?)?.toDouble() ?? 0,
      totalVolume: (map['total_volume'] as num?)?.toDouble() ?? 0,
      sparkLineIn7d: SparkLine.fromJson(
        map['sparkline_in_7d'] as Map<String, dynamic>,
      ),
      priceChangePercentage1hInCurrency:
          (map['price_change_percentage_1h_in_currency'] as num?)?.toDouble() ??
          0,
      priceChangePercentage24hInCurrency:
          (map['price_change_percentage_24h_in_currency'] as num?)
              ?.toDouble() ??
          0,
      priceChangePercentage7dInCurrency:
          (map['price_change_percentage_7d_in_currency'] as num?)?.toDouble() ??
          0,
    );
  }
}
