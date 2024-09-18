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
  City? get city => throw _privateConstructorUsedError;
  List<DriveRouteEntity> get routes => throw _privateConstructorUsedError;
  DriveRouteEntity? get gameRoute => throw _privateConstructorUsedError;
  Set<Marker> get markers => throw _privateConstructorUsedError;
  Set<Polyline> get polylines => throw _privateConstructorUsedError;
  Timer? get timer => throw _privateConstructorUsedError;
  num get speed => throw _privateConstructorUsedError;
  int get dseconds => throw _privateConstructorUsedError;
  num? get balance => throw _privateConstructorUsedError;
  LooseWinEntity? get looseWin => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  Polyline? get polylineAfter => throw _privateConstructorUsedError;
  Map<int, int> get secondsWithTapsMap => throw _privateConstructorUsedError;
  bool get lastTapWasSend => throw _privateConstructorUsedError;
  CameraPosition get cameraPosition => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      City? city,
      List<DriveRouteEntity> routes,
      DriveRouteEntity? gameRoute,
      Set<Marker> markers,
      Set<Polyline> polylines,
      Timer? timer,
      num speed,
      int dseconds,
      num? balance,
      LooseWinEntity? looseWin,
      double distance,
      Polyline? polylineAfter,
      Map<int, int> secondsWithTapsMap,
      bool lastTapWasSend,
      CameraPosition cameraPosition});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? city = freezed,
    Object? routes = null,
    Object? gameRoute = freezed,
    Object? markers = null,
    Object? polylines = null,
    Object? timer = freezed,
    Object? speed = null,
    Object? dseconds = null,
    Object? balance = freezed,
    Object? looseWin = freezed,
    Object? distance = null,
    Object? polylineAfter = freezed,
    Object? secondsWithTapsMap = null,
    Object? lastTapWasSend = null,
    Object? cameraPosition = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStateType,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
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
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as num,
      dseconds: null == dseconds
          ? _value.dseconds
          : dseconds // ignore: cast_nullable_to_non_nullable
              as int,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num?,
      looseWin: freezed == looseWin
          ? _value.looseWin
          : looseWin // ignore: cast_nullable_to_non_nullable
              as LooseWinEntity?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      polylineAfter: freezed == polylineAfter
          ? _value.polylineAfter
          : polylineAfter // ignore: cast_nullable_to_non_nullable
              as Polyline?,
      secondsWithTapsMap: null == secondsWithTapsMap
          ? _value.secondsWithTapsMap
          : secondsWithTapsMap // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      lastTapWasSend: null == lastTapWasSend
          ? _value.lastTapWasSend
          : lastTapWasSend // ignore: cast_nullable_to_non_nullable
              as bool,
      cameraPosition: null == cameraPosition
          ? _value.cameraPosition
          : cameraPosition // ignore: cast_nullable_to_non_nullable
              as CameraPosition,
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
      City? city,
      List<DriveRouteEntity> routes,
      DriveRouteEntity? gameRoute,
      Set<Marker> markers,
      Set<Polyline> polylines,
      Timer? timer,
      num speed,
      int dseconds,
      num? balance,
      LooseWinEntity? looseWin,
      double distance,
      Polyline? polylineAfter,
      Map<int, int> secondsWithTapsMap,
      bool lastTapWasSend,
      CameraPosition cameraPosition});
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl>
    implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(
      _$GameStateImpl _value, $Res Function(_$GameStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? city = freezed,
    Object? routes = null,
    Object? gameRoute = freezed,
    Object? markers = null,
    Object? polylines = null,
    Object? timer = freezed,
    Object? speed = null,
    Object? dseconds = null,
    Object? balance = freezed,
    Object? looseWin = freezed,
    Object? distance = null,
    Object? polylineAfter = freezed,
    Object? secondsWithTapsMap = null,
    Object? lastTapWasSend = null,
    Object? cameraPosition = null,
  }) {
    return _then(_$GameStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStateType,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
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
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as num,
      dseconds: null == dseconds
          ? _value.dseconds
          : dseconds // ignore: cast_nullable_to_non_nullable
              as int,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num?,
      looseWin: freezed == looseWin
          ? _value.looseWin
          : looseWin // ignore: cast_nullable_to_non_nullable
              as LooseWinEntity?,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      polylineAfter: freezed == polylineAfter
          ? _value.polylineAfter
          : polylineAfter // ignore: cast_nullable_to_non_nullable
              as Polyline?,
      secondsWithTapsMap: null == secondsWithTapsMap
          ? _value._secondsWithTapsMap
          : secondsWithTapsMap // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
      lastTapWasSend: null == lastTapWasSend
          ? _value.lastTapWasSend
          : lastTapWasSend // ignore: cast_nullable_to_non_nullable
              as bool,
      cameraPosition: null == cameraPosition
          ? _value.cameraPosition
          : cameraPosition // ignore: cast_nullable_to_non_nullable
              as CameraPosition,
    ));
  }
}

/// @nodoc

class _$GameStateImpl implements _GameState {
  const _$GameStateImpl(
      {this.status = GameStateType.loading,
      this.city = null,
      final List<DriveRouteEntity> routes = const [],
      this.gameRoute = null,
      final Set<Marker> markers = const {},
      final Set<Polyline> polylines = const {},
      this.timer = null,
      this.speed = 0,
      this.dseconds = 0,
      this.balance = null,
      this.looseWin = null,
      this.distance = 0,
      this.polylineAfter = null,
      final Map<int, int> secondsWithTapsMap = const {},
      this.lastTapWasSend = false,
      this.cameraPosition = const CameraPosition(
          target: GameBloc._defaultPosition, zoom: GameBloc._defaultZoom)})
      : _routes = routes,
        _markers = markers,
        _polylines = polylines,
        _secondsWithTapsMap = secondsWithTapsMap;

  @override
  @JsonKey()
  final GameStateType status;
  @override
  @JsonKey()
  final City? city;
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
  final Timer? timer;
  @override
  @JsonKey()
  final num speed;
  @override
  @JsonKey()
  final int dseconds;
  @override
  @JsonKey()
  final num? balance;
  @override
  @JsonKey()
  final LooseWinEntity? looseWin;
  @override
  @JsonKey()
  final double distance;
  @override
  @JsonKey()
  final Polyline? polylineAfter;
  final Map<int, int> _secondsWithTapsMap;
  @override
  @JsonKey()
  Map<int, int> get secondsWithTapsMap {
    if (_secondsWithTapsMap is EqualUnmodifiableMapView)
      return _secondsWithTapsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_secondsWithTapsMap);
  }

  @override
  @JsonKey()
  final bool lastTapWasSend;
  @override
  @JsonKey()
  final CameraPosition cameraPosition;

  @override
  String toString() {
    return 'GameState(status: $status, city: $city, routes: $routes, gameRoute: $gameRoute, markers: $markers, polylines: $polylines, timer: $timer, speed: $speed, dseconds: $dseconds, balance: $balance, looseWin: $looseWin, distance: $distance, polylineAfter: $polylineAfter, secondsWithTapsMap: $secondsWithTapsMap, lastTapWasSend: $lastTapWasSend, cameraPosition: $cameraPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other._routes, _routes) &&
            (identical(other.gameRoute, gameRoute) ||
                other.gameRoute == gameRoute) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            const DeepCollectionEquality()
                .equals(other._polylines, _polylines) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.dseconds, dseconds) ||
                other.dseconds == dseconds) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.looseWin, looseWin) ||
                other.looseWin == looseWin) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.polylineAfter, polylineAfter) ||
                other.polylineAfter == polylineAfter) &&
            const DeepCollectionEquality()
                .equals(other._secondsWithTapsMap, _secondsWithTapsMap) &&
            (identical(other.lastTapWasSend, lastTapWasSend) ||
                other.lastTapWasSend == lastTapWasSend) &&
            (identical(other.cameraPosition, cameraPosition) ||
                other.cameraPosition == cameraPosition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      city,
      const DeepCollectionEquality().hash(_routes),
      gameRoute,
      const DeepCollectionEquality().hash(_markers),
      const DeepCollectionEquality().hash(_polylines),
      timer,
      speed,
      dseconds,
      balance,
      looseWin,
      distance,
      polylineAfter,
      const DeepCollectionEquality().hash(_secondsWithTapsMap),
      lastTapWasSend,
      cameraPosition);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {final GameStateType status,
      final City? city,
      final List<DriveRouteEntity> routes,
      final DriveRouteEntity? gameRoute,
      final Set<Marker> markers,
      final Set<Polyline> polylines,
      final Timer? timer,
      final num speed,
      final int dseconds,
      final num? balance,
      final LooseWinEntity? looseWin,
      final double distance,
      final Polyline? polylineAfter,
      final Map<int, int> secondsWithTapsMap,
      final bool lastTapWasSend,
      final CameraPosition cameraPosition}) = _$GameStateImpl;

  @override
  GameStateType get status;
  @override
  City? get city;
  @override
  List<DriveRouteEntity> get routes;
  @override
  DriveRouteEntity? get gameRoute;
  @override
  Set<Marker> get markers;
  @override
  Set<Polyline> get polylines;
  @override
  Timer? get timer;
  @override
  num get speed;
  @override
  int get dseconds;
  @override
  num? get balance;
  @override
  LooseWinEntity? get looseWin;
  @override
  double get distance;
  @override
  Polyline? get polylineAfter;
  @override
  Map<int, int> get secondsWithTapsMap;
  @override
  bool get lastTapWasSend;
  @override
  CameraPosition get cameraPosition;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
