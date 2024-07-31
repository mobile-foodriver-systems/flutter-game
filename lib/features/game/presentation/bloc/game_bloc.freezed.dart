// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameState {
  GameStateType get status => throw _privateConstructorUsedError;
  City? get cityId => throw _privateConstructorUsedError;
  List<DriveRouteEntity> get routes => throw _privateConstructorUsedError;
  DriveRouteEntity? get gameRoute => throw _privateConstructorUsedError;
  Set<Marker> get markers => throw _privateConstructorUsedError;
  Set<Polyline> get polylines => throw _privateConstructorUsedError;
  int get tapCount => throw _privateConstructorUsedError;
  Timer? get timer => throw _privateConstructorUsedError;
  num get speed => throw _privateConstructorUsedError;
  int get seconds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {GameStateType status,
      City? cityId,
      List<DriveRouteEntity> routes,
      DriveRouteEntity? gameRoute,
      Set<Marker> markers,
      Set<Polyline> polylines,
      int tapCount,
      Timer? timer,
      num speed,
      int seconds});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cityId = freezed,
    Object? routes = null,
    Object? gameRoute = freezed,
    Object? markers = null,
    Object? polylines = null,
    Object? tapCount = null,
    Object? timer = freezed,
    Object? speed = null,
    Object? seconds = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStateType,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as City?,
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<DriveRouteEntity>,
      gameRoute: freezed == gameRoute
          ? _value.gameRoute
          : gameRoute // ignore: cast_nullable_to_non_nullable
              as DriveRouteEntity?,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      polylines: null == polylines
          ? _value.polylines
          : polylines // ignore: cast_nullable_to_non_nullable
              as Set<Polyline>,
      tapCount: null == tapCount
          ? _value.tapCount
          : tapCount // ignore: cast_nullable_to_non_nullable
              as int,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as num,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res>
    implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(
          _$GameStateImpl value, $Res Function(_$GameStateImpl) then) =
      __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GameStateType status,
      City? cityId,
      List<DriveRouteEntity> routes,
      DriveRouteEntity? gameRoute,
      Set<Marker> markers,
      Set<Polyline> polylines,
      int tapCount,
      Timer? timer,
      num speed,
      int seconds});
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cityId = freezed,
    Object? routes = null,
    Object? gameRoute = freezed,
    Object? markers = null,
    Object? polylines = null,
    Object? tapCount = null,
    Object? timer = freezed,
    Object? speed = null,
    Object? seconds = null,
  }) {
    return _then(_$GameStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStateType,
      cityId: freezed == cityId
          ? _value.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as City?,
      routes: null == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<DriveRouteEntity>,
      gameRoute: freezed == gameRoute
          ? _value.gameRoute
          : gameRoute // ignore: cast_nullable_to_non_nullable
              as DriveRouteEntity?,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      polylines: null == polylines
          ? _value._polylines
          : polylines // ignore: cast_nullable_to_non_nullable
              as Set<Polyline>,
      tapCount: null == tapCount
          ? _value.tapCount
          : tapCount // ignore: cast_nullable_to_non_nullable
              as int,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as num,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GameStateImpl implements _GameState {
  const _$GameStateImpl(
      {this.status = GameStateType.loading,
      this.cityId = null,
      final List<DriveRouteEntity> routes = const [],
      this.gameRoute = null,
      final Set<Marker> markers = const {},
      final Set<Polyline> polylines = const {},
      this.tapCount = 0,
      this.timer = null,
      this.speed = 0,
      this.seconds = 0})
      : _routes = routes,
        _markers = markers,
        _polylines = polylines;

  @override
  @JsonKey()
  final GameStateType status;
  @override
  @JsonKey()
  final City? cityId;
  final List<DriveRouteEntity> _routes;
  @override
  @JsonKey()
  List<DriveRouteEntity> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  @override
  @JsonKey()
  final DriveRouteEntity? gameRoute;
  final Set<Marker> _markers;
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  final Set<Polyline> _polylines;
  @override
  @JsonKey()
  Set<Polyline> get polylines {
    if (_polylines is EqualUnmodifiableSetView) return _polylines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_polylines);
  }

  @override
  @JsonKey()
  final int tapCount;
  @override
  @JsonKey()
  final Timer? timer;
  @override
  @JsonKey()
  final num speed;
  @override
  @JsonKey()
  final int seconds;

  @override
  String toString() {
    return 'GameState(status: $status, cityId: $cityId, routes: $routes, gameRoute: $gameRoute, markers: $markers, polylines: $polylines, tapCount: $tapCount, timer: $timer, speed: $speed, seconds: $seconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            const DeepCollectionEquality().equals(other._routes, _routes) &&
            (identical(other.gameRoute, gameRoute) ||
                other.gameRoute == gameRoute) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            const DeepCollectionEquality()
                .equals(other._polylines, _polylines) &&
            (identical(other.tapCount, tapCount) ||
                other.tapCount == tapCount) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.seconds, seconds) || other.seconds == seconds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      cityId,
      const DeepCollectionEquality().hash(_routes),
      gameRoute,
      const DeepCollectionEquality().hash(_markers),
      const DeepCollectionEquality().hash(_polylines),
      tapCount,
      timer,
      speed,
      seconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {final GameStateType status,
      final City? cityId,
      final List<DriveRouteEntity> routes,
      final DriveRouteEntity? gameRoute,
      final Set<Marker> markers,
      final Set<Polyline> polylines,
      final int tapCount,
      final Timer? timer,
      final num speed,
      final int seconds}) = _$GameStateImpl;

  @override
  GameStateType get status;
  @override
  City? get cityId;
  @override
  List<DriveRouteEntity> get routes;
  @override
  DriveRouteEntity? get gameRoute;
  @override
  Set<Marker> get markers;
  @override
  Set<Polyline> get polylines;
  @override
  int get tapCount;
  @override
  Timer? get timer;
  @override
  num get speed;
  @override
  int get seconds;
  @override
  @JsonKey(ignore: true)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
