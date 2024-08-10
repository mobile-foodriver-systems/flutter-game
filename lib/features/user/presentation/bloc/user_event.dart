part of 'user_bloc.dart';

final class UserLoadProfileEvent extends AuthUserEvent {
  const UserLoadProfileEvent();

  @override
  List<Object> get props => [];
}

final class UserUpdateEvent extends AuthUserEvent {
  const UserUpdateEvent({
    this.city,
    this.email,
    this.walletAddress,
    required this.userId,
  });

  final City? city;
  final String? email;
  final String? walletAddress;
  final int userId;

  @override
  List<Object> get props => [
        if (city != null) city!,
        if (email != null) email!,
        if (walletAddress != null) walletAddress!,
        userId,
      ];
}

final class UserUpdateLatLngEvent extends AuthUserEvent {
  const UserUpdateLatLngEvent({
    required this.latLng,
    required this.userId,
  });

  final LatLng latLng;
  final int userId;

  @override
  List<Object> get props => [
        latLng,
        userId,
      ];
}

final class UserSetEvent extends AuthUserEvent {
  const UserSetEvent({
    required this.userEntity,
  });

  final UserEntity userEntity;

  @override
  List<Object> get props => [userEntity];
}
