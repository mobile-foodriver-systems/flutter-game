import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/user/domain/usecases/get_confirmation_code.dart';
import 'package:food_driver/features/user/domain/usecases/send_confirmation_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'edit_profile_bloc.freezed.dart';
part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final GetConfirmationCodeUseCase _getCode;
  final SendConfirmationCodeUseCase _sendCode;
  EditProfileBloc(
    this._getCode,
    this._sendCode,
  ) : super(const _Initial()) {
    on<ChangeDataBeginEvent>(_startChangeData);
    on<ConfirmChangeDataEvent>(_confirmChangeData);
  }

  void _startChangeData(
    ChangeDataBeginEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    if (state == const _Loading()) return;
    emit(const _Loading());
    await _getCode.call(event.email);
    emit(const _CodeSent());
  }

  void _confirmChangeData(
    ConfirmChangeDataEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    if (state == const _Loading()) return;
    emit(const _Loading());
    final response = await _sendCode.call(event.code);
    response.fold(
      (error) {
        emit(_CodeSent(error: error));
      },
      (success) {
        emit(const _Confirmed());
      },
    );
  }
}
