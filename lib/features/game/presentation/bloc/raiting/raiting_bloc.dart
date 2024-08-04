import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/game/data/models/raiting_list.dart';
import 'package:food_driver/features/game/data/models/raiting_params.dart';
import 'package:food_driver/features/game/data/models/raiting_state_type.dart';
import 'package:food_driver/features/game/data/models/user_sort_type.dart';
import 'package:food_driver/features/game/domain/usecases/load_raiting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'raiting_bloc.freezed.dart';
part 'raiting_event.dart';
part 'raiting_state.dart';

@injectable
class RaitingBloc extends Bloc<RaitingEvent, RaitingState> {
  final LoadRaitingUseCase _loadRaiting;
  RaitingBloc(
    this._loadRaiting,
  ) : super(const RaitingState()) {
    on<RaitingLoadEvent>(_load);
  }

  void _load(
    RaitingLoadEvent event,
    Emitter<RaitingState> emit,
  ) async {
    if (state.raitingList == null) {
      emit(state.copyWith(
        status: RaitingStateType.loading,
        error: null,
      ));
    }
    final response = await _loadRaiting(state.raitingList == null
        ? RaitingParams()
        : RaitingParams(
            radiusInKm: state.sort.value,
            offset: (state.raitingList!.offset ?? 0) + state.raitingList!.limit,
          ));
    response.fold(
      (error) {
        emit(state.copyWith(status: RaitingStateType.error, error: error));
      },
      (result) {
        emit(state.copyWith(
          status: RaitingStateType.success,
          raitingList: state.raitingList == null
              ? result
              : RaitingList.update(
                  raitingList: state.raitingList!,
                  list: result.list,
                ),
        ));
      },
    );
  }
}
