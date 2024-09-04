part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;
  const factory EditProfileState.loading() = _Loading;
  const factory EditProfileState.codeSent({Failure? error}) = _CodeSent;
  const factory EditProfileState.confirmed() = _Confirmed;
}
