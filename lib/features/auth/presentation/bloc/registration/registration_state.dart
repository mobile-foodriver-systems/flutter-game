part of 'registration_bloc.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    @Default(RegistrationStatus.form) RegistrationStatus status,
    @Default(null) Failure? error,
  }) = _RegistrationState;
}
