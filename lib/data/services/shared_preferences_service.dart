import 'dart:developer';

import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(env: [Environment.dev])
class SharedPreferencesService {
  SharedPreferencesService(SharedPreferences sharedPreferences)
    : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  static const kTodosCollectionKey = '__favorites_collection_key__';

  Future<Result<String?>> getData() async {
    try {
      log('Buscando os favoritos no SharedPreferences');
      return Result.ok(_sharedPreferences.getString(kTodosCollectionKey));
    } on Exception catch (e) {
      log('Erro ao buscar favoritos no SharedPreferences', error: e);
      return Result.error(e);
    }
  }

  Future<Result<void>> setData(String value) async {
    try {
      log('Adicionando favoritos no SharedPreferences');
      await _sharedPreferences.setString(kTodosCollectionKey, value);
      return const Result.ok(null);
    } on Exception catch (e) {
      log('Erro ao adicionar favoritos no SharedPreferences', error: e);
      return Result.error(e);
    }
  }
}
