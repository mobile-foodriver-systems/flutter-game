// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i7;
import 'package:dio/dio.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../core/platform/network_info.dart' as _i4;
import '../core/platform/network_info_impl.dart' as _i5;
import '../core/providers/dio/dio_provider.dart' as _i3;
import '../core/services/http/app_http_service.dart' as _i11;
import '../core/services/local_storage/local_storage_service.dart' as _i8;
import '../core/services/local_storage/local_storage_service_impl.dart' as _i9;
import '../features/auth/data_source/local/auth_local_data_source.dart' as _i13;
import '../features/auth/data_source/local/auth_local_data_source_impl.dart'
    as _i14;
import '../features/auth/data_source/remote/auth_remote_data_source.dart'
    as _i17;
import '../features/auth/data_source/remote/auth_remote_data_source_impl.dart'
    as _i18;
import '../features/game/data_source/remote/game_remote_data_source.dart'
    as _i15;
import '../features/game/data_source/remote/game_remote_data_source_impl.dart'
    as _i16;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.DioProvider>(() => _i3.DioProvider());
    gh.lazySingleton<_i4.NetworkInfo>(
      () => _i5.NetworkInfoImpl(
        gh<_i6.InternetConnectionChecker>(),
        gh<_i7.Connectivity>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.singleton<_i8.LocalStorageService>(
        () => _i9.LocalStorageServiceImpl(gh<_i10.SharedPreferences>()));
    gh.lazySingleton<_i11.AppHttpService>(() => _i11.AppHttpService(
          gh<_i3.DioProvider>(),
          gh<_i4.NetworkInfo>(),
          gh<List<_i12.InterceptorsWrapper>>(),
        ));
    gh.lazySingleton<_i13.AuthLocalDataSource>(
      () => _i14.AuthLocalDataSourceImpl(gh<_i8.LocalStorageService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i15.GameRemoteDataSource>(
      () => _i16.GameRemoteDataSourceImpl(gh<_i11.AppHttpService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i17.AuthRemoteDataSource>(
      () => _i18.AuthRemoteDataSourceImpl(gh<_i11.AppHttpService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    return this;
  }
}
