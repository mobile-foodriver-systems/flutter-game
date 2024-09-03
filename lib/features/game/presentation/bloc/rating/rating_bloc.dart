import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:food_driver/core/errors/failure/failure.dart';
import 'package:food_driver/core/ui/view/bi_directional_scroll_view.dart';
import 'package:food_driver/di/injection.dart';
import 'package:food_driver/features/game/data/models/rating_list.dart';
import 'package:food_driver/features/game/data/models/rating_params.dart';
import 'package:food_driver/features/game/data/models/user_rating.dart';
import 'package:food_driver/features/game/data/models/user_sort_type.dart';
import 'package:food_driver/features/game/domain/usecases/load_rating.dart';
import 'package:food_driver/features/game/domain/usecases/load_user_rating.dart';
import 'package:food_driver/features/location/data/models/list_status.dart';
import 'package:food_driver/features/user/domain/entities/user_entity.dart';
import 'package:food_driver/features/user/domain/repositories/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'rating_bloc.freezed.dart';
part 'rating_event.dart';
part 'rating_state.dart';

@injectable
class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final LoadRatingUseCase _loadRating;
  final LoadUserRatingUseCase _loadUserRating;
  final UserRepository userRepository = getIt<UserRepository>();

  RatingBloc(
    this._loadRating,
    this._loadUserRating,
  ) : super(const RatingState(status: ListStatus.initial)) {
    on<RatingLoadEvent>(_load);
    on<RatingInitEvent>(_init);
    on<RatingReloadEvent>(_reload);
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
        prevItemsLoading: true,
      ));
    } else {
      emit(state.copyWith(
        nextItemsLoading: true,
      ));
    }
    final params = RatingParams(
      offset: event.direction == Direction.up
          ? state.topOffset
          : state.bottomOffset,
      radiusInKm: event.sort.value,
      longitude: event.sort == UsersSortType.global
          ? null
          : state.user?.city?.location?.longitude,
      latitude: event.sort == UsersSortType.global
          ? null
          : state.user?.city?.location?.latitude,
    );

    final response = await _loadRating(params);
    response.fold(
      (error) {
        emit(state.copyWith(status: ListStatus.error, error: error));
      },
      (result) {
        final (:topOffset, :bottomOffset) = getOffsets(
          event,
          result.limit,
        );

        emit(state.copyWith(
          status: ListStatus.success,
          topOffset: topOffset < 0 ? 0 : topOffset,
          bottomOffset: bottomOffset,
          prevItemsLoading:
              event.direction.isUp ? false : state.prevItemsLoading,
          nextItemsLoading:
              event.direction.isDown ? false : state.nextItemsLoading,
          isAllNextLoaded: event.direction.isDown
              ? result.list.isEmpty
              : state.isAllNextLoaded,
          isAllPrevLoaded: event.direction.isUp
              ? state.topOffset == 0 || (topOffset > 0 && result.list.isEmpty)
              : state.isAllPrevLoaded,
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
    if (state.user == null) {
      await loadUser(emit);
    }

    final params = RatingParams(
      radiusInKm: event.sort.value,
      longitude: state.user?.city?.location?.longitude,
      latitude: state.user?.city?.location?.latitude,
    );

    final response = await _loadUserRating(params);
    response.fold(
      (error) {
        emit(state.copyWith(status: ListStatus.error, error: error));
      },
      (result) async {
        UserRating? userPosition;
        if (state.position == null && (state.userId ?? event.userId) != null) {
          userPosition = result.list.firstWhereOrNull(
            (i) => i.id == (state.userId ?? event.userId),
          );
        }

        final (:topOffset, :bottomOffset) = initOffsets(
          result.offset ?? 0,
          result.list.length,
        );

        emit(state.copyWith(
          userId: state.userId ?? event.userId,
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
        await event.initializedCallback?.call();
      },
    );
  }

  ({int topOffset, int bottomOffset}) getOffsets(
    RatingLoadEvent event,
    int limit,
  ) {
    var topOffset = state.topOffset ?? 0;
    var bottomOffset = state.bottomOffset ?? 0;
    if (event.direction == Direction.up) {
      topOffset = (state.topOffset ?? 0) - limit;
    } else if (event.direction == Direction.down) {
      bottomOffset += limit;
    }
    return (topOffset: topOffset, bottomOffset: bottomOffset);
  }

  ({int topOffset, int bottomOffset}) initOffsets(
    int offset,
    int listLength,
  ) {
    var topOffset = state.topOffset ?? 0;
    var bottomOffset = state.bottomOffset ?? 0;
    topOffset = offset - listLength;
    bottomOffset += offset + listLength;
    return (topOffset: topOffset, bottomOffset: bottomOffset);
  }

  FutureOr<void> _reload(
    RatingReloadEvent event,
    Emitter<RatingState> emit,
  ) async {
    if (state.status == ListStatus.loading) return;
    emit(
      state.copyWith(
        status: ListStatus.loading,
        prevItemsLoading: false,
        nextItemsLoading: false,
        bottomOffset: null,
        topOffset: null,
        dataInitialized: false,
        isAllNextLoaded: false,
        isAllPrevLoaded: false,
        ratingList: RatingList(),
        sort: event.sort,
      ),
    );
    add(
      RatingInitEvent(
        sort: event.sort,
        initializedCallback: () async {
          add(RatingLoadEvent(
            sort: event.sort,
            direction: Direction.down,
          ));
          add(RatingLoadEvent(
            sort: event.sort,
            direction: Direction.up,
          ));
        },
      ),
    );
  }

  Future<void> loadUser(
    Emitter<RatingState> emit,
  ) async {
    final result = await userRepository.getUser();
    result.fold(
      (error) => () {},
      (result) {
        emit(state.copyWith(user: result));
      },
    );
  }
}
