import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:food_driver/app.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/localization/data/datasources/local/asset_loader.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await configureDependencies(
    environment: appFlavor == 'dev' ? Environment.dev : Environment.prod,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'Ru'),
      ],
      path: 'resources/langs',
      assetLoader: RemoteConfigAssetLoader(),
      child: const App(),
    ),
  );
  FlutterNativeSplash.remove();
}
