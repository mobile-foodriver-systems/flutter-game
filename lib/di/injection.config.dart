// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:food_driver/core/platform/network_info.dart' as _i984;
import 'package:food_driver/core/platform/network_info_impl.dart' as _i771;
import 'package:food_driver/core/providers/dio/dio_provider.dart' as _i370;
import 'package:food_driver/core/services/http/app_http_service.dart' as _i528;
import 'package:food_driver/core/services/interceptors/auth_interceptor.dart'
    as _i535;
import 'package:food_driver/core/services/local_storage/local_storage_service.dart'
    as _i203;
import 'package:food_driver/core/services/local_storage/local_storage_service_impl.dart'
    as _i58;
import 'package:food_driver/di/injection.dart' as _i442;
import 'package:food_driver/features/auth/data/datasources/local/auth_local_data_source.dart'
    as _i927;
import 'package:food_driver/features/auth/data/datasources/remote/auth_remote_data_source.dart'
    as _i977;
import 'package:food_driver/features/auth/domain/repositories/auth_repository.dart'
    as _i55;
import 'package:food_driver/features/auth/domain/usecases/broke_access_token.dart'
    as _i618;
import 'package:food_driver/features/auth/domain/usecases/check_auth.dart'
    as _i879;
import 'package:food_driver/features/auth/domain/usecases/get_access_token.dart'
    as _i245;
import 'package:food_driver/features/auth/domain/usecases/login_by_password.dart'
    as _i1009;
import 'package:food_driver/features/auth/domain/usecases/logout.dart' as _i422;
import 'package:food_driver/features/auth/domain/usecases/refresh_auth.dart'
    as _i942;
import 'package:food_driver/features/auth/domain/usecases/registration.dart'
    as _i377;
import 'package:food_driver/features/auth/presentation/bloc/auth/auth_bloc.dart'
    as _i667;
import 'package:food_driver/features/auth/presentation/bloc/registration/registration_bloc.dart'
    as _i415;
import 'package:food_driver/features/game/data/datasources/remote/game_remote_data_source.dart'
    as _i259;
import 'package:food_driver/features/game/domain/repositories/game_repository.dart'
    as _i927;
import 'package:food_driver/features/game/domain/usecases/load.dart' as _i251;
import 'package:food_driver/features/game/domain/usecases/load_raiting.dart'
    as _i508;
import 'package:food_driver/features/game/domain/usecases/play.dart' as _i930;
import 'package:food_driver/features/game/domain/usecases/start.dart' as _i353;
import 'package:food_driver/features/game/domain/usecases/stop.dart' as _i824;
import 'package:food_driver/features/game/presentation/bloc/game/game_bloc.dart'
    as _i379;
import 'package:food_driver/features/game/presentation/bloc/raiting/raiting_bloc.dart'
    as _i982;
import 'package:food_driver/features/location/data/datasources/remote/location_remote_data_source.dart'
    as _i208;
import 'package:food_driver/features/location/domain/repositories/location_repository.dart'
    as _i275;
import 'package:food_driver/features/location/domain/usecases/city_by_lat_lng.dart'
    as _i680;
import 'package:food_driver/features/location/presentation/bloc/city/city_bloc.dart'
    as _i510;
import 'package:food_driver/features/location/presentation/bloc/country/country_bloc.dart'
    as _i4;
import 'package:food_driver/features/user/data/datasources/remote/user_remote_data_source.dart'
    as _i545;
import 'package:food_driver/features/user/data/datasources/remote/user_remote_data_source_impl.dart'
    as _i551;
import 'package:food_driver/features/user/domain/repositories/user_repository.dart'
    as _i687;
import 'package:food_driver/features/user/domain/usecases/load_profile.dart'
    as _i978;
import 'package:food_driver/features/user/domain/usecases/update.dart' as _i238;
import 'package:food_driver/features/user/domain/usecases/update_lat_lng.dart'
    as _i198;
import 'package:food_driver/features/user/presentation/bloc/user_bloc.dart'
    as _i223;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i370.DioProvider>(() => _i370.DioProvider());
    gh.factory<_i510.CityBloc>(() => _i510.CityBloc());
    gh.factory<_i4.CountryBloc>(() => _i4.CountryBloc());
    gh.singleton<_i973.InternetConnectionChecker>(
        () => registerModule.internetConnectionChecker);
    gh.singleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.singleton<String>(() => registerModule.locale);
    gh.factory<_i824.StopUseCase>(
      () => _i824.StopUseCase(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i930.PlayUseCase>(
      () => _i930.PlayUseCase(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i353.StartUseCase>(
      () => _i353.StartUseCase(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i203.LocalStorageService>(
        () => _i58.LocalStorageServiceImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i984.NetworkInfo>(() => _i771.NetworkInfoImpl(
          gh<_i973.InternetConnectionChecker>(),
          gh<_i895.Connectivity>(),
        ));
    gh.lazySingleton<_i927.AuthLocalDataSource>(
      () => _i927.AuthLocalDataSourceImpl(gh<_i203.LocalStorageService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i528.AppHttpService>(
      () => _i528.AppHttpService(
        gh<_i370.DioProvider>(),
        gh<_i984.NetworkInfo>(),
        gh<String>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i208.LocationRemoteDataSource>(
      () => _i208.LocationRemoteDataSourceImpl(gh<_i528.AppHttpService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i259.GameRemoteDataSource>(
      () => _i259.GameRemoteDataSourceImpl(gh<_i528.AppHttpService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i545.UserRemoteDataSource>(
      () => _i551.UserRemoteDataSourceImpl(gh<_i528.AppHttpService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i927.GameRepository>(
      () => _i927.GameRepositoryImpl(gh<_i259.GameRemoteDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i977.AuthRemoteDataSource>(
      () => _i977.AuthRemoteDataSourceImpl(gh<_i528.AppHttpService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i275.LocationRepository>(
      () => _i275.LocationRepositoryImpl(gh<_i208.LocationRemoteDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i680.CityByLatLngUseCase>(
      () => _i680.CityByLatLngUseCase(gh<_i275.LocationRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i251.LoadUseCase>(
      () => _i251.LoadUseCase(gh<_i927.GameRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i508.LoadRaitingUseCase>(
      () => _i508.LoadRaitingUseCase(gh<_i927.GameRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i687.UserRepository>(
      () => _i687.UserRepositoryImpl(gh<_i545.UserRemoteDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i55.AuthRepository>(
      () => _i55.AuthRepositoryImpl(
        gh<_i927.AuthLocalDataSource>(),
        gh<_i977.AuthRemoteDataSource>(),
      ),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i379.GameBloc>(() => _i379.GameBloc(
          gh<_i251.LoadUseCase>(),
          gh<_i353.StartUseCase>(),
          gh<_i930.PlayUseCase>(),
          gh<_i824.StopUseCase>(),
          gh<_i680.CityByLatLngUseCase>(),
        ));
    gh.factory<_i978.LoadProfileUseCase>(
      () => _i978.LoadProfileUseCase(gh<_i687.UserRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i238.UpdateUserUseCase>(
      () => _i238.UpdateUserUseCase(gh<_i687.UserRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i198.UpdateUserLatLngUseCase>(
      () => _i198.UpdateUserLatLngUseCase(gh<_i687.UserRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i982.RaitingBloc>(
        () => _i982.RaitingBloc(gh<_i508.LoadRaitingUseCase>()));
    gh.factory<_i245.GetAccessTokenUseCase>(
      () => _i245.GetAccessTokenUseCase(gh<_i55.AuthRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i618.BreakAccessTokenUseCase>(
      () => _i618.BreakAccessTokenUseCase(gh<_i55.AuthRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i942.RefreshAuthUseCase>(
      () => _i942.RefreshAuthUseCase(gh<_i55.AuthRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i377.RegistrationUseCase>(
      () => _i377.RegistrationUseCase(gh<_i55.AuthRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i422.LogoutUseCase>(
      () => _i422.LogoutUseCase(gh<_i55.AuthRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i1009.LoginByPasswordUseCase>(
      () => _i1009.LoginByPasswordUseCase(gh<_i55.AuthRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i535.AuthInterceptor>(() => _i535.AuthInterceptor(
          refreshAuth: gh<_i942.RefreshAuthUseCase>(),
          authRepository: gh<_i55.AuthRepository>(),
          getAccessToken: gh<_i245.GetAccessTokenUseCase>(),
          logout: gh<_i422.LogoutUseCase>(),
        ));
    gh.factory<_i415.RegistrationBloc>(
        () => _i415.RegistrationBloc(gh<_i377.RegistrationUseCase>()));
    gh.factory<_i879.CheckAuthUseCase>(
      () => _i879.CheckAuthUseCase(
        gh<_i55.AuthRepository>(),
        gh<_i687.UserRepository>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i223.UserBloc>(() => _i223.UserBloc(
          gh<_i978.LoadProfileUseCase>(),
          gh<_i238.UpdateUserUseCase>(),
          gh<_i198.UpdateUserLatLngUseCase>(),
        ));
    gh.factory<_i667.AuthBloc>(() => _i667.AuthBloc(
          gh<_i1009.LoginByPasswordUseCase>(),
          gh<_i422.LogoutUseCase>(),
          gh<_i879.CheckAuthUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i442.RegisterModule {
  @override
  _i973.InternetConnectionChecker get internetConnectionChecker =>
      _i973.InternetConnectionChecker();

  @override
  _i895.Connectivity get connectivity => _i895.Connectivity();
}
