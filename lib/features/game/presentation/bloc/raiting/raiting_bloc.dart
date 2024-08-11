import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/features/game/data/models/raiting_list.dart';
import 'package:food_driver/features/game/data/models/raiting_params.dart';
import 'package:food_driver/features/game/data/models/user_sort_type.dart';
import 'package:food_driver/features/game/domain/usecases/load_raiting.dart';
import 'package:food_driver/features/location/data/models/list_status.dart';
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
    if ((state.raitingList == null || event.sort != state.sort) &&
        state.status != ListStatus.loading) {
      emit(state.copyWith(
        status: ListStatus.initial,
        error: null,
        sort: event.sort,
        raitingList: null,
      ));
    }
    if (state.raitingList != null &&
            (state.raitingList?.list.length ?? 0) >=
                (state.raitingList?.count ?? 0) ||
        state.status == ListStatus.loading) {
      return;
    }
    if (state.raitingList != null) {
      emit(state.copyWith(status: ListStatus.loading));
    }
    final params = state.raitingList == null
        ? RaitingParams()
        : RaitingParams(
            offset: (state.raitingList!.count ?? 0) <
                    ((state.raitingList!.offset ?? 0) +
                        state.raitingList!.limit)
                ? state.raitingList!.offset ?? 0
                : (state.raitingList!.offset ?? 0) + state.raitingList!.limit,
            radiusInKm: event.sort.value,
          );
    final response = await _loadRaiting(params);
    response.fold(
      (error) {
        emit(state.copyWith(status: ListStatus.error, error: error));
      },
      (result) {
        emit(state.copyWith(
          status: ListStatus.success,
          raitingList: RaitingList.update(
            raitingList: state.raitingList ??
                RaitingList(
                  count: result.count,
                  limit: result.limit,
                  offset: 0,
                  list: [],
                ),
            list: result.list,
            offset: params.offset ?? 0,
          ),
          sort: event.sort,
        ));
      },
    );
  }
}
