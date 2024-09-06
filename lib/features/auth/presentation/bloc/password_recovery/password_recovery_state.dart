part of 'password_recovery_bloc.dart';

@freezed
class PasswordRecoveryState with _$PasswordRecoveryState {
  const factory PasswordRecoveryState.initial() = _Initial;
  const factory PasswordRecoveryState.loading() = _Loading;
  const factory PasswordRecoveryState.codeSent({Failure? error}) = _CodeSent;
  const factory PasswordRecoveryState.confirmed() = _Confirmed;
}
