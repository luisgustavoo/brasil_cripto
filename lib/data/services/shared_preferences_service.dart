import 'dart:developer';

import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPreferencesService {
  SharedPreferencesService(SharedPreferences sharedPreferences)
    : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  static const kFavoriteKey = '__favorite_key__';

  Future<Result<List<String>?>> getData() async {
    try {
      log('Buscando os favoritos no SharedPreferences');
      return Result.ok(_sharedPreferences.getStringList(kFavoriteKey));
    } on Exception catch (e) {
      log('Erro ao buscar favoritos no SharedPreferences', error: e);
      return Result.error(e);
    }
  }

  Future<Result<void>> setData(List<String> values) async {
    try {
      log('Adicionando favoritos no SharedPreferences');
      await _sharedPreferences.setStringList(kFavoriteKey, values);
      return const Result.ok(null);
    } on Exception catch (e) {
      log('Erro ao adicionar favoritos no SharedPreferences', error: e);
      return Result.error(e);
    }
  }
}
