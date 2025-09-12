import 'dart:convert';
import 'dart:developer';

import 'package:brasil_cripto/data/services/shared_preferences_service.dart';
import 'package:brasil_cripto/domain/models/coin.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocalDataService {
  LocalDataService(SharedPreferencesService sharedPreferences)
    : _sharedPreferences = sharedPreferences;

  final SharedPreferencesService _sharedPreferences;

  Future<Result<void>> addFavorite(List<Coin> coins) async {
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

  Future<Result<void>> getFavorites() async {
    try {
      final result = await _sharedPreferences.getData();
      switch (result) {
        case Ok<String?>():
          if (result.value?.isEmpty ?? true) {
            return const Result.ok(null);
          }
          log(result.value!);
          return const Result.ok(null);

        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
