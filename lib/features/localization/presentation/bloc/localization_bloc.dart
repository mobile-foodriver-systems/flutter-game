import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/localization/domain/usecases/load_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'localization_bloc.freezed.dart';
part 'localization_event.dart';
part 'localization_state.dart';

@singleton
class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final LoadLocalizationUseCase _loadLocales;
  LocalizationBloc(this._loadLocales) : super(const _Initial()) {
    on<LocalizationEvent>(_loadSupportedLocales);
  }

  void _loadSupportedLocales(
    LocalizationEvent event,
    Emitter<LocalizationState> emit,
  ) async {
    emit(const _Loading());
    await _loadLocales.call(NoParams());
    emit(const _Success());
  }
}
