import 'package:brasil_cripto/data/services/shared_preferences_service.dart';
import 'package:brasil_cripto/utils/result.dart';

class FakeSharedPreferencesService implements SharedPreferencesService {
  String value = '';

  @override
  Future<Result<String?>> getData() {
    return Future.value(Result.ok(value));
  }

  @override
  Future<Result<void>> setData(String value) {
    this.value = value;
    return Future.value(const Result.ok(null));
  }
}
