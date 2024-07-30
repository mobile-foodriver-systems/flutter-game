import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/user/data/models/user_status.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/domain/usecases/load_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final LoadProfileUseCase _loadProfile;
  UserBloc(this._loadProfile) : super(const UserState()) {
    on<UserLoadProfileEvent>(_load);
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
}
