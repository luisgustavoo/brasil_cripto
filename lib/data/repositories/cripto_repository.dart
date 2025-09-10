import 'package:brasil_cripto/utils/result.dart';

abstract class CriptoRepository {
  Future<Result<List<dynamic>>> fetchCriptos();
}
