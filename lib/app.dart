import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:food_driver/core/services/locale_service/locale_service.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/data/models/auth_status.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_driver/features/auth/presentation/pages/auth_page.dart';
import 'package:food_driver/features/game/presentation/pages/error_page.dart';
import 'package:food_driver/features/game/presentation/pages/game_page.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
import 'package:food_driver/features/localization/fallback_localization_delegate.dart';
import 'package:food_driver/features/localization/presentation/bloc/localization_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<LocalizationBloc>(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  late final LocaleService _localeService;

  @override
  void initState() {
    _localeService = getIt<LocaleService>();
    super.initState();
    initApp(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        EasyLocalization.of(context)!.delegate,
        FallbackLocalizationDelegate(),
      ],
      locale: EasyLocalization.of(context)?.locale,
      supportedLocales: EasyLocalization.of(context)?.supportedLocales ?? [],
      title: 'Food Driver',
      theme: appTheme(context),
      builder: (context, child) {
        _localeService.locale = Localizations.localeOf(context);
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthStatus.authenticated:
                if (state.user == null) {
                  _navigator.push(ErrorPage.route);
                  return;
                }
                _navigator.pushAndRemoveUntil<void>(
                  GamePage.route(user: state.user!),
                  (route) => false,
                );
              case AuthStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  AuthPage.route,
                  (route) => false,
                );
              case AuthStatus.unknown:
              case AuthStatus.loading:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: LoadingIndicator(),
        ),
      ),
    );
  }

  Future<void> initApp(BuildContext context) async {
    context.read<AuthBloc>().add(const AuthCheckEvent());
    FlutterNativeSplash.remove();
  }
}
