// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i6;
import 'package:dio/dio.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../core/platform/network_info.dart' as _i9;
import '../core/platform/network_info_impl.dart' as _i10;
import '../core/providers/dio/dio_provider.dart' as _i3;
import '../core/services/http/app_http_service.dart' as _i13;
import '../core/services/local_storage/local_storage_service.dart' as _i7;
import '../core/services/local_storage/local_storage_service_impl.dart' as _i8;
import '../features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i11;
import '../features/auth/data/data_source/local/auth_local_data_source_impl.dart'
    as _i12;
import '../features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i19;
import '../features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i20;
import '../features/auth/data/repository/auth_repository.dart' as _i21;
import '../features/game/data/data_source/remote/game_remote_data_source.dart'
    as _i17;
import '../features/game/data/data_source/remote/game_remote_data_source_impl.dart'
    as _i18;
import '../features/profile/data/data_source/remote/profile_remote_data_source.dart'
    as _i15;
import '../features/profile/data/data_source/remote/profile_remote_data_source_impl.dart'
    as _i16;
import 'injection.dart' as _i22;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.DioProvider>(() => _i3.DioProvider());
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i5.InternetConnectionChecker>(
        () => registerModule.internetConnectionChecker);
    gh.singleton<_i6.Connectivity>(() => registerModule.connectivity);
    gh.singleton<_i7.LocalStorageService>(
        () => _i8.LocalStorageServiceImpl(gh<_i4.SharedPreferences>()));
    gh.lazySingleton<_i9.NetworkInfo>(() => _i10.NetworkInfoImpl(
          gh<_i5.InternetConnectionChecker>(),
          gh<_i6.Connectivity>(),
        ));
    gh.lazySingleton<_i11.AuthLocalDataSource>(
      () => _i12.AuthLocalDataSourceImpl(gh<_i7.LocalStorageService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i13.AppHttpService>(() => _i13.AppHttpService(
          gh<_i3.DioProvider>(),
          gh<_i9.NetworkInfo>(),
          gh<List<_i14.InterceptorsWrapper>>(),
        ));
    gh.lazySingleton<_i15.ProfileRemoteDataSource>(
      () => _i16.ProfileRemoteDataSourceImpl(gh<_i13.AppHttpService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i17.GameRemoteDataSource>(
      () => _i18.GameRemoteDataSourceImpl(gh<_i13.AppHttpService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i19.AuthRemoteDataSource>(
      () => _i20.AuthRemoteDataSourceImpl(gh<_i13.AppHttpService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i21.AuthRepository>(
      () => _i21.AuthRepositoryImpl(
        gh<_i11.AuthLocalDataSource>(),
        gh<_i19.AuthRemoteDataSource>(),
      ),
      registerFor: {
        _prod,
        _dev,
      },
    );
    return this;
  }
}

class _$RegisterModule extends _i22.RegisterModule {
  @override
  _i5.InternetConnectionChecker get internetConnectionChecker =>
      _i5.InternetConnectionChecker();

  @override
  _i6.Connectivity get connectivity => _i6.Connectivity();
}
