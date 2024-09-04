import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:food_driver/app.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/localization/data/datasources/local/asset_loader.dart';
import 'package:food_driver/features/localization/presentation/bloc/localization_bloc.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await configureDependencies(
    environment: appFlavor == 'dev' ? Environment.dev : Environment.prod,
  );
  final localizationBloc = getIt<LocalizationBloc>();
  await localizationBloc.loadCacheLocales();
  final locales = await localizationBloc.getCachedLocales();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    EasyLocalization(
      supportedLocales: locales,
      path: 'resources/langs',
      assetLoader: RemoteConfigAssetLoader(),
      child: const App(),
    ),
  );
}
