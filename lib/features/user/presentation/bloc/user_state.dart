part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(UserStatus.loading) UserStatus status,
    @Default(null) UserEntity? user,
  }) = _UserState;
}
