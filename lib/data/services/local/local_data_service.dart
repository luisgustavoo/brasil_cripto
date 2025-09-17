import 'dart:convert';
import 'dart:developer';

import 'package:brasil_cripto/data/services/shared_preferences_service.dart';
import 'package:brasil_cripto/utils/result.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocalDataService {
  LocalDataService({required SharedPreferencesService sharedPreferencesService})
    : _sharedPreferencesService = sharedPreferencesService;

  final SharedPreferencesService _sharedPreferencesService;

  Future<Result<void>> addFavorite(List<String> names) async {
    try {
      final result = await _sharedPreferencesService.setData(jsonEncode(names));
      switch (result) {
        case Ok<void>():
          return const Result.ok(null);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      log('Erro ao adicionar favorito', error: e);
      return Result.error(e);
    }
  }

  Future<Result<List<String>>> getFavorites() async {
    try {
      final result = await _sharedPreferencesService.getData();
      switch (result) {
        case Ok<String?>():
          final value = result.value;
          if (value?.isEmpty ?? true) {
            return const Result.ok([]);
          }
          final names = (jsonDecode(value!) as List<dynamic>)
              .map(
                (e) => e.toString(),
              )
              .toList();

          return Result.ok(names);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      log('Erro ao buscar favoritos', error: e);
      return Result.error(e);
    }
  }
}
