import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/ui/view/bi_directional_scroll_view.dart';
import 'package:food_driver/core/usecases/usecase.dart';
import 'package:food_driver/features/game/data/models/rating_list.dart';
import 'package:food_driver/features/game/data/models/rating_params.dart';
import 'package:food_driver/features/game/data/models/user_rating.dart';
import 'package:food_driver/features/game/data/models/user_sort_type.dart';
import 'package:food_driver/features/game/domain/usecases/load_rating.dart';
import 'package:food_driver/features/game/domain/usecases/load_user_rating.dart';
import 'package:food_driver/features/location/data/models/list_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'rating_bloc.freezed.dart';
part 'rating_event.dart';
part 'rating_state.dart';

@injectable
class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final LoadRatingUseCase _loadRating;
  final LoadUserRatingUseCase _loadUserRating;

  RatingBloc(
    this._loadRating,
    this._loadUserRating,
  ) : super(const RatingState(status: ListStatus.initial)) {
    on<RatingLoadEvent>(_load);
    on<RatingInitEvent>(_init);
  }

  Future<void> _load(
    RatingLoadEvent event,
    Emitter<RatingState> emit,
  ) async {
    if (state.isAllLoaded(event.direction)) return;
    var isLoading = event.direction.isDown
        ? state.nextItemsLoading
        : state.prevItemsLoading;
    if (isLoading) return;

    if (event.direction.isUp) {
      emit(state.copyWith(
        status: ListStatus.loading,
        prevItemsLoading: true,
      ));
    } else {
      emit(state.copyWith(
        status: ListStatus.loading,
        nextItemsLoading: true,
      ));
    }

    final params = RatingParams(
      offset: event.direction == Direction.up
          ? state.topOffset
          : state.bottomOffset,
      radiusInKm: event.sort.value,
    );

    final response = await _loadRating(params);
    response.fold(
      (error) {
        emit(state.copyWith(status: ListStatus.error, error: error));
      },
      (result) {
        final (:topOffset, :bottomOffset) = getOffsets(
          event,
          result.list.length,
        );

        emit(state.copyWith(
          status: ListStatus.success,
          topOffset: topOffset,
          bottomOffset: bottomOffset,
          prevItemsLoading:
              event.direction.isUp ? false : state.prevItemsLoading,
          nextItemsLoading:
              event.direction.isDown ? false : state.nextItemsLoading,
          isAllNextLoaded: event.direction.isDown ? result.list.isEmpty : false,
          isAllPrevLoaded: event.direction.isUp ? topOffset == 0 : false,
          ratingList: RatingList.update(
            ratingList: state.ratingList ?? RatingList(),
            list: result.list,
            direction: event.direction,
          ),
          sort: event.sort,
        ));
      },
    );
  }

  Future<void> _init(
    RatingInitEvent event,
    Emitter<RatingState> emit,
  ) async {
    final response = await _loadUserRating(NoParams());
    response.fold(
      (error) {
        emit(state.copyWith(status: ListStatus.error, error: error));
      },
      (result) async {
        final (:topOffset, :bottomOffset) = initOffsets(
          result.offset ?? 0,
          result.list.length,
        );
        UserRating? userPosition;
        if (state.position == null && event.userId != null) {
          userPosition =
              result.list.firstWhereOrNull((i) => i.id == event.userId);
        }

        emit(state.copyWith(
          status: ListStatus.initial,
          topOffset: topOffset,
          position: userPosition,
          dataInitialized: true,
          bottomOffset: bottomOffset,
          ratingList: RatingList.update(
            ratingList: RatingList(),
            list: result.list,
            direction: Direction.down,
          ),
          sort: event.sort,
        ));
        event.initializedCallback.call();
      },
    );
  }

  ({int topOffset, int bottomOffset}) getOffsets(
    RatingLoadEvent event,
    int listLength,
  ) {
    var topOffset = state.topOffset;
    var bottomOffset = state.bottomOffset;
    if (event.direction == Direction.up) {
      topOffset = state.topOffset - listLength;
      if (topOffset <= 0) topOffset = 0;
    } else if (event.direction == Direction.down) {
      bottomOffset += listLength;
    }
    return (topOffset: topOffset, bottomOffset: bottomOffset);
  }

  ({int topOffset, int bottomOffset}) initOffsets(
    int offset,
    int listLength,
  ) {
    var topOffset = state.topOffset;
    var bottomOffset = state.bottomOffset;
    topOffset = offset - listLength;
    if (topOffset <= 0) topOffset = 0;
    bottomOffset += offset + listLength;
    return (topOffset: topOffset, bottomOffset: bottomOffset);
  }
}
