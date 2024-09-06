import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/user/domain/entities/confirm_recovery_params.dart';
import 'package:food_driver/features/user/domain/entities/recovery_params.dart';
import 'package:food_driver/features/user/domain/usecases/confirm_recovery_password.dart';
import 'package:food_driver/features/user/domain/usecases/recovery_password.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'password_recovery_bloc.freezed.dart';
part 'password_recovery_event.dart';
part 'password_recovery_state.dart';

@injectable
class PasswordRecoveryBloc
    extends Bloc<PasswordRecoveryEvent, PasswordRecoveryState> {
  final RecoveryPasswordUseCase _recoveryPassword;
  final ConfirmRecoveryPasswordUseCase _confirmRecoveryPassword;

  PasswordRecoveryBloc(
    this._recoveryPassword,
    this._confirmRecoveryPassword,
  ) : super(const _Initial()) {
    on<ChangePasswordBeginEvent>(_changePassword);
    on<ConfirmPasswordChangeEvent>(_confirmChangePassword);
  }

  void _changePassword(
    ChangePasswordBeginEvent event,
    Emitter<PasswordRecoveryState> emit,
  ) async {
    if (state == const _Loading()) return;
    emit(const _Loading());
    await _recoveryPassword.call(RecoveryParams(
      email: event.email,
      password: event.newPassword,
    ));
    emit(const _CodeSent());
  }

  void _confirmChangePassword(
    ConfirmPasswordChangeEvent event,
    Emitter<PasswordRecoveryState> emit,
  ) async {
    if (state == const _Loading()) return;
    emit(const _Loading());
    final response = await _confirmRecoveryPassword.call(ConfirmRecoveryParams(
      email: event.email,
      code: event.code,
    ));
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
