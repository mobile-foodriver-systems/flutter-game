// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/platform/network_info.dart' as _i461;
import '../core/platform/network_info_impl.dart' as _i832;
import '../core/providers/dio/dio_provider.dart' as _i291;
import '../core/services/http/app_http_service.dart' as _i990;
import '../core/services/local_storage/local_storage_service.dart' as _i1062;
import '../core/services/local_storage/local_storage_service_impl.dart'
    as _i753;
import '../features/auth/data/datasources/local/auth_local_data_source.dart'
    as _i148;
import '../features/auth/data/datasources/local/auth_local_data_source_impl.dart'
    as _i758;
import '../features/auth/data/datasources/remote/auth_remote_data_source.dart'
    as _i236;
import '../features/auth/data/datasources/remote/auth_remote_data_source_impl.dart'
    as _i143;
import '../features/auth/domain/repositories/auth_repository.dart' as _i869;
import '../features/auth/domain/usecases/login_by_password.dart' as _i1043;
import '../features/auth/domain/usecases/logout.dart' as _i338;
import '../features/auth/presentation/bloc/auth_bloc.dart' as _i59;
import '../features/game/data/datasources/remote/game_remote_data_source.dart'
    as _i326;
import '../features/game/data/datasources/remote/game_remote_data_source_impl.dart'
    as _i851;
import '../features/game/presentation/bloc/game_bloc.dart' as _i744;
import '../features/user/data/datasources/remote/user_remote_data_source.dart'
    as _i487;
import '../features/user/data/datasources/remote/user_remote_data_source_impl.dart'
    as _i415;
import '../features/user/domain/repositories/user_repository.dart' as _i751;
import 'injection.dart' as _i464;

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
    gh.factory<_i291.DioProvider>(() => _i291.DioProvider());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i744.GameBloc>(() => _i744.GameBloc());
    gh.singleton<_i973.InternetConnectionChecker>(
        () => registerModule.internetConnectionChecker);
    gh.singleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.singleton<_i1062.LocalStorageService>(
        () => _i753.LocalStorageServiceImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i461.NetworkInfo>(() => _i832.NetworkInfoImpl(
          gh<_i973.InternetConnectionChecker>(),
          gh<_i895.Connectivity>(),
        ));
    gh.lazySingleton<_i148.AuthLocalDataSource>(
      () => _i758.AuthLocalDataSourceImpl(gh<_i1062.LocalStorageService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i990.AppHttpService>(() => _i990.AppHttpService(
          gh<_i291.DioProvider>(),
          gh<_i461.NetworkInfo>(),
          gh<List<_i361.InterceptorsWrapper>>(),
        ));
    gh.lazySingleton<_i487.UserRemoteDataSource>(
      () => _i415.UserRemoteDataSourceImpl(gh<_i990.AppHttpService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i236.AuthRemoteDataSource>(
      () => _i143.AuthRemoteDataSourceImpl(gh<_i990.AppHttpService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i326.GameRemoteDataSource>(
      () => _i851.GameRemoteDataSourceImpl(gh<_i990.AppHttpService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i751.UserRepository>(
      () => _i751.UserRepositoryImpl(gh<_i487.UserRemoteDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i869.AuthRepository>(
      () => _i869.AuthRepositoryImpl(
        gh<_i148.AuthLocalDataSource>(),
        gh<_i236.AuthRemoteDataSource>(),
      ),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i1043.LoginByPasswordUseCase>(
      () => _i1043.LoginByPasswordUseCase(gh<_i869.AuthRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i338.LogoutUseCase>(
      () => _i338.LogoutUseCase(gh<_i869.AuthRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i59.AuthBloc>(() => _i59.AuthBloc(
          gh<_i1043.LoginByPasswordUseCase>(),
          gh<_i338.LogoutUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {
  @override
  _i973.InternetConnectionChecker get internetConnectionChecker =>
      _i973.InternetConnectionChecker();

  @override
  _i895.Connectivity get connectivity => _i895.Connectivity();
}
