// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:brasil_cripto/config/dependencies.dart' as _i126;
import 'package:brasil_cripto/data/repositories/coins_markets_repository.dart'
    as _i778;
import 'package:brasil_cripto/data/repositories/coins_markets_repository_remote.dart'
    as _i134;
import 'package:brasil_cripto/data/services/api/api_client.dart' as _i653;
import 'package:brasil_cripto/data/services/background/coins_markets_background_service.dart'
    as _i507;
import 'package:brasil_cripto/data/services/http/dio_http_client.dart' as _i450;
import 'package:brasil_cripto/data/services/http/http_client.dart' as _i260;
import 'package:brasil_cripto/ui/home/view_models/home_view_model.dart'
    as _i582;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i260.HttpClient>(() => _i450.DioHttpClient());
    gh.lazySingleton<_i507.CoinsMarketsBackgroundService>(
      () => _i507.CoinsMarketsBackgroundService(
        httpClient: gh<_i260.HttpClient>(),
      ),
    );
    gh.factory<_i653.ApiClient>(
      () => _i653.ApiClient(httpClient: gh<_i260.HttpClient>()),
    );
    gh.factory<_i778.CoinsMarketsRepository>(
      () => _i134.CoinsMarketsRepositoryRemote(
        apiClient: gh<_i653.ApiClient>(),
        coinsMarketsBackgroundService:
            gh<_i507.CoinsMarketsBackgroundService>(),
      ),
    );
    gh.lazySingleton<_i582.HomeViewModel>(
      () => _i582.HomeViewModel(
        coinsMarketsRepository: gh<_i778.CoinsMarketsRepository>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i126.RegisterModule {}
