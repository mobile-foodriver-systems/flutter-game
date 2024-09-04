import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:food_driver/constants/duration_constants.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/data/models/auth_status.dart';
import 'package:food_driver/features/auth/domain/entities/auth_params.dart';
import 'package:food_driver/features/auth/domain/usecases/check_auth.dart';
import 'package:food_driver/features/auth/domain/usecases/delete.dart';
import 'package:food_driver/features/auth/domain/usecases/login_by_password.dart';
import 'package:food_driver/features/auth/domain/usecases/logout.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth/auth_user_event.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
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
  final DeleteUseCase _delete;
  AuthBloc(
    this._loginByPassword,
    this._logout,
    this._checkAuth,
    this._delete,
  ) : super(const AuthState()) {
    on<AuthLoginByPasswordEvent>(_onAuthLoginByPassword);
    on<AuthLogoutEvent>(_onAuthLogout);
    on<AuthCheckEvent>(_onAuthCheck);
    on<AuthDeleteEvent>(_onAuthDelete);
    on<AuthStartConfirmationTimer>(_onStartTimer);
    on<AuthStopConfirmationTimer>(_onStopTimer);
    on<AuthUpdateConfirmationTime>(_onUpdateConfirmationTime);
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
        add(const AuthCheckEvent());
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
    if (state.status != AuthStatus.loading) {
      emit(state.copyWith(status: AuthStatus.loading));
    }
    final response = await _checkAuth.call(NoParams());
    response.fold(
      (error) {
        emit(state.copyWith(status: AuthStatus.unauthenticated));
      },
      (result) async {
        final (auth, user) = result;
        if (auth.refreshToken?.isEmpty ?? true) {
          emit(state.copyWith(
            status: AuthStatus.unauthenticated,
            user: user,
          ));
          return;
        }
        if (user != null) {
          emit(state.copyWith(
            status: AuthStatus.authenticated,
            user: user,
          ));
        } else {
          emit(state.copyWith(status: AuthStatus.unauthenticated));
        }
      },
    );
  }

  void _onAuthDelete(
    AuthDeleteEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _delete(NoParams());
    emit(state.copyWith(status: AuthStatus.unauthenticated));
  }

  void _onStartTimer(
    AuthStartConfirmationTimer event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      confirmationDataTimer:
          Timer.periodic(const Duration(seconds: 1), timerCallback),
      confirmationDataTimerSeconds:
          DurationConstants.emailConfirmation.inSeconds,
    ));
  }

  void _onUpdateConfirmationTime(
    AuthUpdateConfirmationTime event,
    Emitter<AuthState> emit,
  ) {
    var seconds = state.confirmationDataTimerSeconds - 1;
    emit(state.copyWith(
      confirmationDataTimerSeconds: seconds,
    ));
  }

  void _onStopTimer(
    AuthStopConfirmationTimer event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(
      confirmationDataTimer: null,
      confirmationDataTimerSeconds: 0,
    ));
  }

  void timerCallback(timer) {
    if (state.confirmationDataTimerSeconds == 0) {
      timer.cancel();
      add(AuthStopConfirmationTimer());
      return;
    }
    add(AuthUpdateConfirmationTime());
  }
}
