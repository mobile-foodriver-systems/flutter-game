import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/data/models/auth_status.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_driver/features/auth/presentation/pages/auth_page.dart';
import 'package:food_driver/features/game/presentation/pages/error_page.dart';
import 'package:food_driver/features/game/presentation/pages/game_page.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
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

  @override
  void initState() {
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
      ],
      locale: EasyLocalization.of(context)?.locale,
      supportedLocales: EasyLocalization.of(context)?.supportedLocales ?? [],
      title: 'Food Driver',
      theme: appTheme(context),
      builder: (context, child) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (BuildContext context, AuthState state) {
            FlutterNativeSplash.remove();
            switch (state.status) {
              case AuthStatus.authenticated:
                if (state.user == null) {
                  return Navigator(
                    key: _navigatorKey,
                    onGenerateRoute: (_) => ErrorPage.route,
                  );
                }
                return Navigator(
                  key: _navigatorKey,
                  onGenerateRoute: (_) => GamePage.route(
                    user: state.user!,
                  ),
                );
              case AuthStatus.unauthenticated:
                return Navigator(
                  key: _navigatorKey,
                  onGenerateRoute: (_) => AuthPage.route,
                );
              case AuthStatus.unknown:
              case AuthStatus.loading:
            }
            return const Scaffold(
              body: LoadingIndicator(),
            );
          },
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
    context.read<LocalizationBloc>().add(const LocalizationEvent());
  }
}
