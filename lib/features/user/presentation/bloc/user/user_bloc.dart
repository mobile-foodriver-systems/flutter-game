import 'package:bloc/bloc.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/auth/presentation/bloc/auth/auth_user_event.dart';
import 'package:food_driver/features/location/data/models/city.dart';
import 'package:food_driver/features/user/data/models/user_status.dart';
import 'package:food_driver/features/user/domain/entities/update_user_lat_lng_params.dart';
import 'package:food_driver/features/user/domain/entities/update_user_params.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/domain/usecases/load_profile.dart';
import 'package:food_driver/features/user/domain/usecases/update.dart';
import 'package:food_driver/features/user/domain/usecases/update_lat_lng.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

@injectable
class UserBloc extends Bloc<AuthUserEvent, UserState> {
  final LoadProfileUseCase _loadProfile;
  final UpdateUserUseCase _update;
  final UpdateUserLatLngUseCase _updateLatLng;
  UserBloc(
    this._loadProfile,
    this._update,
    this._updateLatLng,
  ) : super(const UserState()) {
    on<UserLoadProfileEvent>(_load);
    on<UserUpdateEvent>(_userUpdate);
    on<UserUpdateLatLngEvent>(_userUpdateLatLng);
  }

  void _load(
    UserLoadProfileEvent event,
    Emitter<UserState> emit,
  ) async {
    final response = await _loadProfile.call(NoParams());
    response.fold(
      (error) {
        emit(state.copyWith(status: UserStatus.error));
      },
      (result) {
        emit(state.copyWith(
          status: UserStatus.success,
          user: result,
        ));
      },
    );
  }

  void _userUpdate(
    UserUpdateEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      status: UserStatus.loading,
      error: null,
    ));
    final response = await _update.call(UpdateUserParams(
      cityId: event.city?.id,
      email: event.email,
      walletAddress: event.walletAddress,
    ));
    response.fold(
      (error) {
        emit(state.copyWith(
          status: UserStatus.success,
          error: error,
        ));
      },
      (result) {
        emit(state.copyWith(
          status: UserStatus.success,
          user: UserEntity.update(
            user: state.user,
            city: event.city,
            email: event.email,
            walletAddress: event.walletAddress,
          ),
        ));
      },
    );
  }

  void _userUpdateLatLng(
    UserUpdateLatLngEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));
    final response = await _updateLatLng.call(UpdateUserLatLngParams(
      latLng: event.latLng,
    ));
    response.fold(
      (error) {
        emit(state.copyWith(
          status: UserStatus.success,
          error: error,
        ));
      },
      (result) {
        emit(state.copyWith(status: UserStatus.success));
      },
    );
  }
}
