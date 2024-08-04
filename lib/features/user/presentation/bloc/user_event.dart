part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class UserLoadProfileEvent extends UserEvent {
  const UserLoadProfileEvent();

  @override
  List<Object> get props => [];
}

final class UserUpdateEvent extends UserEvent {
  const UserUpdateEvent({
    this.city,
    this.email,
    this.walletAddress,
  });

  final City? city;
  final String? email;
  final String? walletAddress;

  @override
  List<Object> get props => [];
}

final class UserUpdateLatLngEvent extends UserEvent {
  const UserUpdateLatLngEvent({
    required this.latLng,
  });

  final LatLng latLng;

  @override
  List<Object> get props => [];
}

final class UserSetEvent extends UserEvent {
  const UserSetEvent({
    required this.userEntity,
  });

  final UserEntity userEntity;

  @override
  List<Object> get props => [userEntity];
}
