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
import 'package:food_driver/core/services/email_confirmation/email_confirmation_service.dart'
    as _i552;
import 'package:food_driver/core/services/geolocation/geolocation_service.dart'
    as _i435;
import 'package:food_driver/core/services/geolocation/geolocation_service_impl.dart'
    as _i318;
import 'package:food_driver/core/services/http/app_http_service.dart' as _i528;
import 'package:food_driver/core/services/interceptors/auth_interceptor.dart'
    as _i535;
import 'package:food_driver/core/services/local_storage/local_storage_service.dart'
    as _i203;
import 'package:food_driver/core/services/local_storage/local_storage_service_impl.dart'
    as _i58;
import 'package:food_driver/core/services/locale_service/locale_service.dart'
    as _i720;
import 'package:food_driver/core/services/one_time_rating_location_request/one_time_rating_location_request.dart'
    as _i298;
import 'package:food_driver/core/services/password_confirmation_service/password_confirmation_service.dart'
    as _i1039;
import 'package:food_driver/core/services/signal_r/signal_r_service.dart'
    as _i48;
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
import 'package:food_driver/features/auth/domain/usecases/delete.dart' as _i684;
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
import 'package:food_driver/features/auth/presentation/bloc/password_recovery/password_recovery_bloc.dart'
    as _i1004;
import 'package:food_driver/features/auth/presentation/bloc/registration/registration_bloc.dart'
    as _i415;
import 'package:food_driver/features/game/data/datasources/remote/game_remote_data_source.dart'
    as _i259;
import 'package:food_driver/features/game/domain/repositories/game_repository.dart'
    as _i927;
import 'package:food_driver/features/game/domain/usecases/cancel_route.dart'
    as _i186;
import 'package:food_driver/features/game/domain/usecases/load_rating.dart'
    as _i499;
import 'package:food_driver/features/game/domain/usecases/load_user_rating.dart'
    as _i746;
import 'package:food_driver/features/game/domain/usecases/move_and_split_polyline.dart'
    as _i510;
import 'package:food_driver/features/game/domain/usecases/send_tap.dart'
    as _i135;
import 'package:food_driver/features/game/domain/usecases/start.dart' as _i353;
import 'package:food_driver/features/game/domain/usecases/stop_vibrate.dart'
    as _i690;
import 'package:food_driver/features/game/domain/usecases/take_route.dart'
    as _i758;
import 'package:food_driver/features/game/domain/usecases/vibrate.dart'
    as _i520;
import 'package:food_driver/features/game/presentation/bloc/game/game_bloc.dart'
    as _i379;
import 'package:food_driver/features/game/presentation/bloc/rating/rating_bloc.dart'
    as _i381;
import 'package:food_driver/features/localization/data/datasources/local/localization_local_data_source.dart'
    as _i176;
import 'package:food_driver/features/localization/data/datasources/remote/localization_remote_data_source.dart'
    as _i929;
import 'package:food_driver/features/localization/domain/repositories/localization_cache_repository.dart'
    as _i203;
import 'package:food_driver/features/localization/domain/repositories/localization_repository.dart'
    as _i419;
import 'package:food_driver/features/localization/domain/usecases/cache_localization.dart'
    as _i744;
import 'package:food_driver/features/localization/domain/usecases/change_language.dart'
    as _i483;
import 'package:food_driver/features/localization/domain/usecases/get_cached_localization.dart'
    as _i924;
import 'package:food_driver/features/localization/domain/usecases/load_localization.dart'
    as _i352;
import 'package:food_driver/features/localization/presentation/bloc/localization_bloc.dart'
    as _i459;
import 'package:food_driver/features/location/data/datasources/remote/location_remote_data_source.dart'
    as _i208;
import 'package:food_driver/features/location/domain/repositories/location_repository.dart'
    as _i275;
import 'package:food_driver/features/location/domain/usecases/city_by_lat_lng.dart'
    as _i680;
import 'package:food_driver/features/location/domain/usecases/load_city.dart'
    as _i1067;
import 'package:food_driver/features/location/domain/usecases/load_country.dart'
    as _i980;
import 'package:food_driver/features/location/presentation/bloc/city/city_bloc.dart'
    as _i510;
import 'package:food_driver/features/location/presentation/bloc/country/country_bloc.dart'
    as _i4;
import 'package:food_driver/features/tournament/data/datasources/tournament_remote_datasource.dart'
    as _i102;
import 'package:food_driver/features/tournament/domain/repositories/tournament_repository.dart'
    as _i286;
import 'package:food_driver/features/tournament/domain/usecases/load_tournament.dart'
    as _i197;
import 'package:food_driver/features/tournament/presentation/bloc/tournament_bloc.dart'
    as _i566;
import 'package:food_driver/features/user/data/datasources/remote/user_remote_data_source.dart'
    as _i545;
import 'package:food_driver/features/user/data/datasources/remote/user_remote_data_source_impl.dart'
    as _i551;
import 'package:food_driver/features/user/domain/repositories/user_repository.dart'
    as _i687;
import 'package:food_driver/features/user/domain/usecases/confirm_recovery_password.dart'
    as _i9;
import 'package:food_driver/features/user/domain/usecases/get_confirmation_code.dart'
    as _i254;
import 'package:food_driver/features/user/domain/usecases/load_profile.dart'
    as _i978;
import 'package:food_driver/features/user/domain/usecases/recovery_password.dart'
    as _i29;
import 'package:food_driver/features/user/domain/usecases/send_confirmation_code.dart'
    as _i602;
import 'package:food_driver/features/user/domain/usecases/update.dart' as _i238;
import 'package:food_driver/features/user/domain/usecases/update_lat_lng.dart'
    as _i198;
import 'package:food_driver/features/user/presentation/bloc/edit_profile/edit_profile_bloc.dart'
    as _i427;
import 'package:food_driver/features/user/presentation/bloc/user/user_bloc.dart'
    as _i48;
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
    gh.factory<_i370.DioProvider>(() => _i370.DioProvider());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i552.EmailConfirmationService>(
        () => _i552.EmailConfirmationService());
    gh.singleton<_i720.LocaleService>(() => _i720.LocaleService());
    gh.singleton<_i298.OneTimeRatingLocationRequest>(
        () => _i298.OneTimeRatingLocationRequest());
    gh.singleton<_i1039.PasswordConfirmationService>(
        () => _i1039.PasswordConfirmationService());
    gh.singleton<_i973.InternetConnectionChecker>(
        () => registerModule.internetConnectionChecker);
    gh.singleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.singleton<_i203.LocalStorageService>(
        () => _i58.LocalStorageServiceImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i176.LocalizationLocalDataSource>(
      () => _i176.LocalizationLocalDataSourceImpl(
          gh<_i203.LocalStorageService>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i510.MoveAndSplitPolylineUseCase>(
      () => _i510.MoveAndSplitPolylineUseCase(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i690.StopVibrateUseCase>(
      () => _i690.StopVibrateUseCase(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i520.VibrateUseCase>(
      () => _i520.VibrateUseCase(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i744.CacheLocalizationUseCase>(
      () => _i744.CacheLocalizationUseCase(
          gh<_i176.LocalizationLocalDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i483.ChangeLanguageUseCase>(
      () =>
          _i483.ChangeLanguageUseCase(gh<_i176.LocalizationLocalDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i924.GetCachedLocalizationUseCase>(
      () => _i924.GetCachedLocalizationUseCase(
          gh<_i176.LocalizationLocalDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i203.LocalizationCacheRepository>(
      () => _i203.LocalizationRepositoryImpl(
          gh<_i176.LocalizationLocalDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
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
        gh<_i720.LocaleService>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i977.AuthRemoteDataSource>(
      () => _i977.AuthRemoteDataSourceImpl(
        gh<_i528.AppHttpService>(),
        gh<_i720.LocaleService>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i102.TournamentRemoteDatasource>(
      () => _i102.TournamentRemoteDatasourceImpl(
        gh<_i528.AppHttpService>(),
        gh<_i720.LocaleService>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i208.LocationRemoteDataSource>(
      () => _i208.LocationRemoteDataSourceImpl(
        gh<_i528.AppHttpService>(),
        gh<_i720.LocaleService>(),
      ),
      registerFor: {
        _dev,
        _prod,
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
    gh.lazySingleton<_i929.LocalizationRemoteDataSource>(
      () => _i929.LocalizationRemoteDataSourceImpl(
        gh<_i528.AppHttpService>(),
        gh<_i720.LocaleService>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i545.UserRemoteDataSource>(
      () => _i551.UserRemoteDataSourceImpl(
        gh<_i528.AppHttpService>(),
        gh<_i720.LocaleService>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.lazySingleton<_i286.TournamentRepository>(
      () => _i286.TournamentRepositoryImpl(
          gh<_i102.TournamentRemoteDatasource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i275.LocationRepository>(
      () => _i275.LocationRepositoryImpl(gh<_i208.LocationRemoteDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.lazySingleton<_i419.LocalizationRepository>(
      () => _i419.LocalizationRepositoryImpl(
          gh<_i929.LocalizationRemoteDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i618.BreakAccessTokenUseCase>(
      () => _i618.BreakAccessTokenUseCase(gh<_i55.AuthRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i684.DeleteUseCase>(
      () => _i684.DeleteUseCase(gh<_i55.AuthRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i245.GetAccessTokenUseCase>(
      () => _i245.GetAccessTokenUseCase(gh<_i55.AuthRepository>()),
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
    gh.factory<_i422.LogoutUseCase>(
      () => _i422.LogoutUseCase(gh<_i55.AuthRepository>()),
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
    gh.singleton<_i435.GeolocationService>(
        () => _i318.GeolocationServiceImpl(gh<_i275.LocationRepository>()));
    gh.lazySingleton<_i535.AuthInterceptor>(() => _i535.AuthInterceptor(
          refreshAuth: gh<_i942.RefreshAuthUseCase>(),
          authRepository: gh<_i55.AuthRepository>(),
          getAccessToken: gh<_i245.GetAccessTokenUseCase>(),
          logout: gh<_i422.LogoutUseCase>(),
        ));
    gh.factory<_i415.RegistrationBloc>(
        () => _i415.RegistrationBloc(gh<_i377.RegistrationUseCase>()));
    gh.lazySingleton<_i48.AppSignalRService>(
      () => _i48.AppSignalRService(authRepository: gh<_i55.AuthRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i680.CityByLatLngUseCase>(
      () => _i680.CityByLatLngUseCase(gh<_i275.LocationRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i1067.LoadCityUseCase>(
      () => _i1067.LoadCityUseCase(gh<_i275.LocationRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i980.LoadCountryUseCase>(
      () => _i980.LoadCountryUseCase(gh<_i275.LocationRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i197.LoadTournamentUseCase>(
      () => _i197.LoadTournamentUseCase(gh<_i286.TournamentRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i510.CityBloc>(
        () => _i510.CityBloc(gh<_i1067.LoadCityUseCase>()));
    gh.factory<_i352.LoadLocalizationUseCase>(
      () => _i352.LoadLocalizationUseCase(gh<_i419.LocalizationRepository>()),
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
    gh.factory<_i4.CountryBloc>(
        () => _i4.CountryBloc(gh<_i980.LoadCountryUseCase>()));
    gh.factory<_i9.ConfirmRecoveryPasswordUseCase>(
      () => _i9.ConfirmRecoveryPasswordUseCase(gh<_i687.UserRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i254.GetConfirmationCodeUseCase>(
      () => _i254.GetConfirmationCodeUseCase(gh<_i687.UserRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i978.LoadProfileUseCase>(
      () => _i978.LoadProfileUseCase(gh<_i687.UserRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i29.RecoveryPasswordUseCase>(
      () => _i29.RecoveryPasswordUseCase(gh<_i687.UserRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i602.SendConfirmationCodeUseCase>(
      () => _i602.SendConfirmationCodeUseCase(gh<_i687.UserRepository>()),
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
    gh.factory<_i566.TournamentBloc>(
        () => _i566.TournamentBloc(gh<_i197.LoadTournamentUseCase>()));
    gh.lazySingleton<_i259.GameRemoteDataSource>(
      () => _i259.GameRemoteDataSourceImpl(
        gh<_i528.AppHttpService>(),
        gh<_i48.AppSignalRService>(),
        gh<_i720.LocaleService>(),
      ),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i1004.PasswordRecoveryBloc>(() => _i1004.PasswordRecoveryBloc(
          gh<_i29.RecoveryPasswordUseCase>(),
          gh<_i9.ConfirmRecoveryPasswordUseCase>(),
        ));
    gh.singleton<_i459.LocalizationBloc>(() => _i459.LocalizationBloc(
          gh<_i352.LoadLocalizationUseCase>(),
          gh<_i744.CacheLocalizationUseCase>(),
          gh<_i924.GetCachedLocalizationUseCase>(),
        ));
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
    gh.factory<_i427.EditProfileBloc>(() => _i427.EditProfileBloc(
          gh<_i254.GetConfirmationCodeUseCase>(),
          gh<_i602.SendConfirmationCodeUseCase>(),
        ));
    gh.factory<_i48.UserBloc>(() => _i48.UserBloc(
          gh<_i978.LoadProfileUseCase>(),
          gh<_i238.UpdateUserUseCase>(),
          gh<_i198.UpdateUserLatLngUseCase>(),
        ));
    gh.factory<_i667.AuthBloc>(() => _i667.AuthBloc(
          gh<_i1009.LoginByPasswordUseCase>(),
          gh<_i422.LogoutUseCase>(),
          gh<_i879.CheckAuthUseCase>(),
          gh<_i684.DeleteUseCase>(),
        ));
    gh.lazySingleton<_i927.GameRepository>(
      () => _i927.GameRepositoryImpl(gh<_i259.GameRemoteDataSource>()),
      registerFor: {
        _prod,
        _dev,
      },
    );
    gh.factory<_i186.CancelRouteUseCase>(
      () => _i186.CancelRouteUseCase(gh<_i927.GameRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i499.LoadRatingUseCase>(
      () => _i499.LoadRatingUseCase(gh<_i927.GameRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i746.LoadUserRatingUseCase>(
      () => _i746.LoadUserRatingUseCase(gh<_i927.GameRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i135.SendTapUseCase>(
      () => _i135.SendTapUseCase(gh<_i927.GameRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i353.StartUseCase>(
      () => _i353.StartUseCase(gh<_i927.GameRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i758.TakeRouteUseCase>(
      () => _i758.TakeRouteUseCase(gh<_i927.GameRepository>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i381.RatingBloc>(() => _i381.RatingBloc(
          gh<_i499.LoadRatingUseCase>(),
          gh<_i746.LoadUserRatingUseCase>(),
        ));
    gh.factory<_i379.GameBloc>(() => _i379.GameBloc(
          gh<_i353.StartUseCase>(),
          gh<_i758.TakeRouteUseCase>(),
          gh<_i186.CancelRouteUseCase>(),
          gh<_i135.SendTapUseCase>(),
          gh<_i680.CityByLatLngUseCase>(),
          gh<_i48.AppSignalRService>(),
          gh<_i510.MoveAndSplitPolylineUseCase>(),
          gh<_i520.VibrateUseCase>(),
          gh<_i690.StopVibrateUseCase>(),
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
