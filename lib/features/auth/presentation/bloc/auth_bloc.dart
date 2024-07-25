import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/features/auth/data/models/auth_status.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/domain/usecases/login_by_password.dart';
import 'package:food_driver/features/auth/domain/usecases/logout.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._loginByPassword,
    this._logout,
  ) : super(const AuthState()) {
    // on<_AuthStatusChanged>(_onAuthStatusChanged);
    on<AuthLoginEvent>(_onAuthLogin);
    on<AuthLogoutEvent>(_onAuthLogout);
    // _authStatusSubscription = _authRepository.status.listen(
    //   (status) => add(_AuthStatusChanged(status)),
    // );
  }

  // final AuthRepository _authRepository;
  final LoginByPasswordUseCase _loginByPassword;
  final LogoutUseCase _logout;
  // late StreamSubscription<AuthStatus> _authStatusSubscription;

  // @override
  // Future<void> close() {
  //   _authStatusSubscription.cancel();
  //   return super.close();
  // }

  // Future<void> _onAuthStatusChanged(
  //   _AuthStatusChanged event,
  //   Emitter<AuthState> emit,
  // ) async {
  //   switch (event.status) {
  //     case AuthStatus.unauthenticated:
  //       return emit(const AuthState.unauthenticated());
  //     case AuthStatus.authenticated:
  //       return emit(
  //         const AuthState.authenticated(),
  //       );
  //     case AuthStatus.unknown:
  //       return emit(const AuthState.unknown());
  //   }
  // }

  void _onAuthLogin(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    final response = await _loginByPassword(
      AuthParams(
        login: event.login,
        password: event.password,
      ),
    );
    response.fold(
      (error) {
        emit(state.copyWith(status: AuthStatus.unauthenticated));
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
}
