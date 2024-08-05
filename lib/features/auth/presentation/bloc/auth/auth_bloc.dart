import 'package:bloc/bloc.dart';

import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/data/models/auth_status.dart';
import 'package:food_driver/features/auth/domain/entities/auth_params.dart';
import 'package:food_driver/features/auth/domain/usecases/check_auth.dart';
import 'package:food_driver/features/auth/domain/usecases/login_by_password.dart';
import 'package:food_driver/features/auth/domain/usecases/logout.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth/auth_user_event.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/domain/usecases/set_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthUserEvent, AuthState> {
  final LoginByPasswordUseCase _loginByPassword;
  final LogoutUseCase _logout;
  final CheckAuthUseCase _checkAuth;
  final SetUserUseCase _setUserUseCase;
  AuthBloc(
    this._loginByPassword,
    this._logout,
    this._checkAuth,
    this._setUserUseCase,
  ) : super(const AuthState()) {
    on<AuthLoginByPasswordEvent>(_onAuthLoginByPassword);
    on<AuthLogoutEvent>(_onAuthLogout);
    on<AuthCheckEvent>(_onAuthCheck);
  }

  void _onAuthLoginByPassword(
    AuthLoginByPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      status: AuthStatus.loading,
      error: null,
    ));
    final response = await _loginByPassword(
      AuthParams(
        login: event.login,
        password: event.password,
      ),
    );
    response.fold(
      (error) {
        emit(state.copyWith(
          status: AuthStatus.unauthenticated,
          error: error,
        ));
      },
      (result) {
        emit(state.copyWith(status: AuthStatus.authenticated));
      },
    );
  }

  void _onAuthLogout(
    AuthLogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _logout(NoParams());
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  void _onAuthCheck(
    AuthCheckEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final response = await _checkAuth.call(NoParams());
    response.fold(
      (error) {
        emit(state.copyWith(status: AuthStatus.unauthenticated));
      },
      (result) async {
        final (auth, user) = result;
        if (auth.refreshToken?.isEmpty ?? true) {
          if (user != null) {
            _setUserUseCase.call(user);
          }
          emit(state.copyWith(
            status: AuthStatus.unauthenticated,
            user: user,
          ));
          return;
        }
        emit(state.copyWith(status: AuthStatus.authenticated));
      },
    );
  }
}
