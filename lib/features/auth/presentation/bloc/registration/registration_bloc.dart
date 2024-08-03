import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/auth/data/models/registration_status.dart';
import 'package:food_driver/features/auth/domain/entities/auth_params.dart';
import 'package:food_driver/features/auth/domain/usecases/registration.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'registration_bloc.freezed.dart';
part 'registration_event.dart';
part 'registration_state.dart';

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc(this._registration) : super(const RegistrationState()) {
    on<AuthRegistrationEvent>(_onAuthRegistration);
  }

  final RegistrationUseCase _registration;

  void _onAuthRegistration(
    AuthRegistrationEvent event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(state.copyWith(
      status: RegistrationStatus.loading,
      error: null,
    ));
    final response = await _registration.call(
      AuthParams(
        login: event.login,
        password: event.password,
      ),
    );

    response.fold(
      (error) {
        emit(state.copyWith(
          status: RegistrationStatus.error,
          error: error,
        ));
      },
      (result) {
        event.doLogin();
      },
    );
  }
}
