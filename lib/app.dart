import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_driver/core/theme/theme_data.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/auth/data/models/auth_status.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:food_driver/features/auth/presentation/pages/auth_page.dart';
import 'package:food_driver/features/game/presentation/bloc/raiting/raiting_bloc.dart';
import 'package:food_driver/features/game/presentation/pages/error_page.dart';
import 'package:food_driver/features/game/presentation/pages/game_page.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
import 'package:food_driver/features/user/presentation/bloc/user_bloc.dart';
import 'package:food_driver/generated/l10n.dart';

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
          create: (_) => getIt<UserBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<RaitingBloc>(),
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
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Food Driver',
      theme: appTheme(context),
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthStatus.authenticated:
                if (state.user == null) {
                  _navigator.push(MaterialPageRoute(
                      builder: (context) => const ErrorPage()));
                  return;
                }
                _navigator.pushAndRemoveUntil<void>(
                  MaterialPageRoute(
                      builder: (context) => GamePage(user: state.user!)),
                  (route) => false,
                );
              case AuthStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  MaterialPageRoute(builder: (context) => const AuthPage()),
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
  }
}
