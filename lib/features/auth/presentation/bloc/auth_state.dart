part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.unknown) AuthStatus status,
  }) = _AuthState;
}
