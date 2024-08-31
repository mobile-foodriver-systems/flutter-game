import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:food_driver/app.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/localization/data/datasources/local/asset_loader.dart';
import 'package:food_driver/features/localization/domain/repositories/localization_cache_repository.dart';
import 'package:food_driver/features/localization/domain/repositories/localization_repository.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await configureDependencies(
    environment: appFlavor == 'dev' ? Environment.dev : Environment.prod,
  );
  final locales = await initSupportedLocales();
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

Future<List<Locale>> initSupportedLocales() async {
  var supportedLocales = [
    const Locale('en'),
    const Locale('ru'),
  ];
  final result = await getIt<LocalizationRepository>().getSupportedLocales();
  result.fold(
    (l) async {
      var result =
          await getIt<LocalizationCacheRepository>().getSupportedLocales();
      result.fold(
        (_) {},
        (r) => supportedLocales = r.availableLocales,
      );
    },
    (r) => supportedLocales = r.availableLocales,
  );
  return supportedLocales;
}
