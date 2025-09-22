import 'package:brasil_cripto/data/services/shared_preferences_service.dart';
import 'package:brasil_cripto/utils/result.dart';

class FakeSharedPreferencesService implements SharedPreferencesService {
  List<String>? values = [];

  @override
  Future<Result<List<String>?>> getData() {
    return Future.value(Result.ok(values));
  }

  @override
  Future<Result<void>> setData(List<String> values) {
    this.values = values;
    return Future.value(const Result.ok(null));
  }
}
