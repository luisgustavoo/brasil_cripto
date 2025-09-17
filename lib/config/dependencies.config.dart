// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:brasil_cripto/config/dependencies.dart' as _i126;
import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository.dart'
    as _i11;
import 'package:brasil_cripto/data/repositories/coins_markets/coins_markets_repository_remote.dart'
    as _i423;
import 'package:brasil_cripto/data/repositories/favorites/favorites_repository.dart'
    as _i568;
import 'package:brasil_cripto/data/repositories/favorites/favorites_repository_local.dart'
    as _i506;
import 'package:brasil_cripto/data/services/api/api_client.dart' as _i653;
import 'package:brasil_cripto/data/services/http/dio_http_client.dart' as _i450;
import 'package:brasil_cripto/data/services/http/http_client.dart' as _i260;
import 'package:brasil_cripto/data/services/local/local_data_service.dart'
    as _i751;
import 'package:brasil_cripto/data/services/shared_preferences_service.dart'
    as _i1038;
import 'package:brasil_cripto/domain/use_cases/favorites/favorite_get_use_case.dart'
    as _i561;
import 'package:brasil_cripto/domain/use_cases/favorites/favorite_toggle_use_case.dart'
    as _i225;
import 'package:brasil_cripto/ui/coins_details/view_models/coins_details_view_model.dart'
    as _i1013;
import 'package:brasil_cripto/ui/coins_markets/view_models/coins_markets_view_model.dart'
    as _i606;
import 'package:brasil_cripto/ui/favorites/view_models/favorite_view_model.dart'
    as _i657;
import 'package:dio/dio.dart' as _i361;
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
    gh.factoryParam<_i260.HttpClient, _i361.BaseOptions?, dynamic>(
      (options, _) => _i450.DioHttpClient(options: options),
    );
    gh.factory<_i653.ApiClient>(
      () => _i653.ApiClient(httpClient: gh<_i260.HttpClient>()),
    );
    gh.factory<_i1038.SharedPreferencesService>(
      () => _i1038.SharedPreferencesService(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i751.LocalDataService>(
      () => _i751.LocalDataService(
        sharedPreferencesService: gh<_i1038.SharedPreferencesService>(),
      ),
    );
    gh.factory<_i11.CoinsMarketsRepository>(
      () =>
          _i423.CoinsMarketsRepositoryRemote(apiClient: gh<_i653.ApiClient>()),
    );
    gh.lazySingleton<_i568.FavoritesRepository>(
      () => _i506.FavoritesRepositoryLocal(
        localDataService: gh<_i751.LocalDataService>(),
      ),
    );
    gh.factory<_i561.FavoriteGetUseCase>(
      () => _i561.FavoriteGetUseCase(
        favoritesRepository: gh<_i568.FavoritesRepository>(),
        coinsMarketsRepository: gh<_i11.CoinsMarketsRepository>(),
      ),
    );
    gh.lazySingleton<_i1013.CoinsDetailsViewModel>(
      () => _i1013.CoinsDetailsViewModel(
        coinsMarketsRepository: gh<_i11.CoinsMarketsRepository>(),
      ),
    );
    gh.lazySingleton<_i606.CoinsMarketViewModel>(
      () => _i606.CoinsMarketViewModel(
        coinsMarketsRepository: gh<_i11.CoinsMarketsRepository>(),
        favoriteGetUseCase: gh<_i561.FavoriteGetUseCase>(),
        favoriteToggleUseCase: gh<_i225.FavoriteToggleUseCase>(),
      ),
    );
    gh.lazySingleton<_i657.FavoriteViewModel>(
      () => _i657.FavoriteViewModel(
        favoriteGetUseCase: gh<_i561.FavoriteGetUseCase>(),
        favoritesRepository: gh<_i568.FavoritesRepository>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i126.RegisterModule {}
