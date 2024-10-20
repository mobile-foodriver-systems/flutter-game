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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure error) error,
    required TResult Function() noCity,
    required TResult Function(
            City city,
            num balance,
            List<DriveRouteEntity> routes,
            Set<Marker> markers,
            CameraPosition cameraPosition)
        initialized,
    required TResult Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)
        game,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Failure error)? error,
    TResult? Function()? noCity,
    TResult? Function(City city, num balance, List<DriveRouteEntity> routes,
            Set<Marker> markers, CameraPosition cameraPosition)?
        initialized,
    TResult? Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)?
        game,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure error)? error,
    TResult Function()? noCity,
    TResult Function(City city, num balance, List<DriveRouteEntity> routes,
            Set<Marker> markers, CameraPosition cameraPosition)?
        initialized,
    TResult Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)?
        game,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NoCity value) noCity,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Game value) game,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NoCity value)? noCity,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Game value)? game,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NoCity value)? noCity,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Game value)? game,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
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
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'GameState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure error) error,
    required TResult Function() noCity,
    required TResult Function(
            City city,
            num balance,
            List<DriveRouteEntity> routes,
            Set<Marker> markers,
            CameraPosition cameraPosition)
        initialized,
    required TResult Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)
        game,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Failure error)? error,
    TResult? Function()? noCity,
    TResult? Function(City city, num balance, List<DriveRouteEntity> routes,
            Set<Marker> markers, CameraPosition cameraPosition)?
        initialized,
    TResult? Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)?
        game,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure error)? error,
    TResult Function()? noCity,
    TResult Function(City city, num balance, List<DriveRouteEntity> routes,
            Set<Marker> markers, CameraPosition cameraPosition)?
        initialized,
    TResult Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)?
        game,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NoCity value) noCity,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Game value) game,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NoCity value)? noCity,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Game value)? game,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NoCity value)? noCity,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Game value)? game,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements GameState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.error});

  @override
  final Failure error;

  @override
  String toString() {
    return 'GameState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure error) error,
    required TResult Function() noCity,
    required TResult Function(
            City city,
            num balance,
            List<DriveRouteEntity> routes,
            Set<Marker> markers,
            CameraPosition cameraPosition)
        initialized,
    required TResult Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)
        game,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Failure error)? error,
    TResult? Function()? noCity,
    TResult? Function(City city, num balance, List<DriveRouteEntity> routes,
            Set<Marker> markers, CameraPosition cameraPosition)?
        initialized,
    TResult? Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)?
        game,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure error)? error,
    TResult Function()? noCity,
    TResult Function(City city, num balance, List<DriveRouteEntity> routes,
            Set<Marker> markers, CameraPosition cameraPosition)?
        initialized,
    TResult Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)?
        game,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NoCity value) noCity,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Game value) game,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NoCity value)? noCity,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Game value)? game,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NoCity value)? noCity,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Game value)? game,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements GameState {
  const factory _Error({required final Failure error}) = _$ErrorImpl;

  Failure get error;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoCityImplCopyWith<$Res> {
  factory _$$NoCityImplCopyWith(
          _$NoCityImpl value, $Res Function(_$NoCityImpl) then) =
      __$$NoCityImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoCityImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$NoCityImpl>
    implements _$$NoCityImplCopyWith<$Res> {
  __$$NoCityImplCopyWithImpl(
      _$NoCityImpl _value, $Res Function(_$NoCityImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NoCityImpl implements _NoCity {
  const _$NoCityImpl();

  @override
  String toString() {
    return 'GameState.noCity()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoCityImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure error) error,
    required TResult Function() noCity,
    required TResult Function(
            City city,
            num balance,
            List<DriveRouteEntity> routes,
            Set<Marker> markers,
            CameraPosition cameraPosition)
        initialized,
    required TResult Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)
        game,
  }) {
    return noCity();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Failure error)? error,
    TResult? Function()? noCity,
    TResult? Function(City city, num balance, List<DriveRouteEntity> routes,
            Set<Marker> markers, CameraPosition cameraPosition)?
        initialized,
    TResult? Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)?
        game,
  }) {
    return noCity?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure error)? error,
    TResult Function()? noCity,
    TResult Function(City city, num balance, List<DriveRouteEntity> routes,
            Set<Marker> markers, CameraPosition cameraPosition)?
        initialized,
    TResult Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)?
        game,
    required TResult orElse(),
  }) {
    if (noCity != null) {
      return noCity();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NoCity value) noCity,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Game value) game,
  }) {
    return noCity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NoCity value)? noCity,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Game value)? game,
  }) {
    return noCity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NoCity value)? noCity,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Game value)? game,
    required TResult orElse(),
  }) {
    if (noCity != null) {
      return noCity(this);
    }
    return orElse();
  }
}

abstract class _NoCity implements GameState {
  const factory _NoCity() = _$NoCityImpl;
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {City city,
      num balance,
      List<DriveRouteEntity> routes,
      Set<Marker> markers,
      CameraPosition cameraPosition});
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? balance = null,
    Object? routes = null,
    Object? markers = null,
    Object? cameraPosition = null,
  }) {
    return _then(_$InitializedImpl(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num,
      routes: null == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<DriveRouteEntity>,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      cameraPosition: null == cameraPosition
          ? _value.cameraPosition
          : cameraPosition // ignore: cast_nullable_to_non_nullable
              as CameraPosition,
    ));
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.city,
      required this.balance,
      final List<DriveRouteEntity> routes = const [],
      final Set<Marker> markers = const {},
      this.cameraPosition = const CameraPosition(
          target: GameBloc._defaultPosition, zoom: GameBloc._defaultZoom)})
      : _routes = routes,
        _markers = markers;

  @override
  final City city;
  @override
  final num balance;
  final List<DriveRouteEntity> _routes;
  @override
  @JsonKey()
  List<DriveRouteEntity> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  final Set<Marker> _markers;
  @override
  @JsonKey()
  Set<Marker> get markers {
    if (_markers is EqualUnmodifiableSetView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_markers);
  }

  @override
  @JsonKey()
  final CameraPosition cameraPosition;

  @override
  String toString() {
    return 'GameState.initialized(city: $city, balance: $balance, routes: $routes, markers: $markers, cameraPosition: $cameraPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            const DeepCollectionEquality().equals(other._routes, _routes) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.cameraPosition, cameraPosition) ||
                other.cameraPosition == cameraPosition));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      city,
      balance,
      const DeepCollectionEquality().hash(_routes),
      const DeepCollectionEquality().hash(_markers),
      cameraPosition);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure error) error,
    required TResult Function() noCity,
    required TResult Function(
            City city,
            num balance,
            List<DriveRouteEntity> routes,
            Set<Marker> markers,
            CameraPosition cameraPosition)
        initialized,
    required TResult Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)
        game,
  }) {
    return initialized(city, balance, routes, markers, cameraPosition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Failure error)? error,
    TResult? Function()? noCity,
    TResult? Function(City city, num balance, List<DriveRouteEntity> routes,
            Set<Marker> markers, CameraPosition cameraPosition)?
        initialized,
    TResult? Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)?
        game,
  }) {
    return initialized?.call(city, balance, routes, markers, cameraPosition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure error)? error,
    TResult Function()? noCity,
    TResult Function(City city, num balance, List<DriveRouteEntity> routes,
            Set<Marker> markers, CameraPosition cameraPosition)?
        initialized,
    TResult Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)?
        game,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(city, balance, routes, markers, cameraPosition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NoCity value) noCity,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Game value) game,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NoCity value)? noCity,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Game value)? game,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NoCity value)? noCity,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Game value)? game,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements GameState {
  const factory _Initialized(
      {required final City city,
      required final num balance,
      final List<DriveRouteEntity> routes,
      final Set<Marker> markers,
      final CameraPosition cameraPosition}) = _$InitializedImpl;

  City get city;
  num get balance;
  List<DriveRouteEntity> get routes;
  Set<Marker> get markers;
  CameraPosition get cameraPosition;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameImplCopyWith<$Res> {
  factory _$$GameImplCopyWith(
          _$GameImpl value, $Res Function(_$GameImpl) then) =
      __$$GameImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {GameStateType status,
      City city,
      num balance,
      DriveRouteEntity gameRoute,
      Set<Marker> markers,
      Set<Polyline> polylines,
      Timer? timer,
      num speed,
      int dseconds,
      LooseWinEntity? looseWin,
      double distance,
      Polyline? polylineAfter,
      Map<int, int> secondsWithTapsMap,
      bool lastTapWasSend,
      CameraPosition cameraPosition});
}

/// @nodoc
class __$$GameImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameImpl>
    implements _$$GameImplCopyWith<$Res> {
  __$$GameImplCopyWithImpl(_$GameImpl _value, $Res Function(_$GameImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? city = null,
    Object? balance = null,
    Object? gameRoute = null,
    Object? markers = null,
    Object? polylines = null,
    Object? timer = freezed,
    Object? speed = null,
    Object? dseconds = null,
    Object? looseWin = freezed,
    Object? distance = null,
    Object? polylineAfter = freezed,
    Object? secondsWithTapsMap = null,
    Object? lastTapWasSend = null,
    Object? cameraPosition = null,
  }) {
    return _then(_$GameImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStateType,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num,
      gameRoute: null == gameRoute
          ? _value.gameRoute
          : gameRoute // ignore: cast_nullable_to_non_nullable
              as DriveRouteEntity,
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

class _$GameImpl implements _Game {
  const _$GameImpl(
      {this.status = GameStateType.starting,
      required this.city,
      required this.balance,
      required this.gameRoute,
      final Set<Marker> markers = const {},
      final Set<Polyline> polylines = const {},
      this.timer = null,
      this.speed = 0,
      this.dseconds = 0,
      this.looseWin = null,
      this.distance = 0,
      this.polylineAfter = null,
      final Map<int, int> secondsWithTapsMap = const {},
      this.lastTapWasSend = false,
      this.cameraPosition = const CameraPosition(
          target: GameBloc._defaultPosition, zoom: GameBloc._defaultZoom)})
      : _markers = markers,
        _polylines = polylines,
        _secondsWithTapsMap = secondsWithTapsMap;

  @override
  @JsonKey()
  final GameStateType status;
  @override
  final City city;
  @override
  final num balance;
  @override
  final DriveRouteEntity gameRoute;
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
    return 'GameState.game(status: $status, city: $city, balance: $balance, gameRoute: $gameRoute, markers: $markers, polylines: $polylines, timer: $timer, speed: $speed, dseconds: $dseconds, looseWin: $looseWin, distance: $distance, polylineAfter: $polylineAfter, secondsWithTapsMap: $secondsWithTapsMap, lastTapWasSend: $lastTapWasSend, cameraPosition: $cameraPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.gameRoute, gameRoute) ||
                other.gameRoute == gameRoute) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            const DeepCollectionEquality()
                .equals(other._polylines, _polylines) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.dseconds, dseconds) ||
                other.dseconds == dseconds) &&
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
      balance,
      gameRoute,
      const DeepCollectionEquality().hash(_markers),
      const DeepCollectionEquality().hash(_polylines),
      timer,
      speed,
      dseconds,
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
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      __$$GameImplCopyWithImpl<_$GameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Failure error) error,
    required TResult Function() noCity,
    required TResult Function(
            City city,
            num balance,
            List<DriveRouteEntity> routes,
            Set<Marker> markers,
            CameraPosition cameraPosition)
        initialized,
    required TResult Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)
        game,
  }) {
    return game(
        status,
        city,
        balance,
        gameRoute,
        markers,
        polylines,
        timer,
        speed,
        dseconds,
        looseWin,
        distance,
        polylineAfter,
        secondsWithTapsMap,
        lastTapWasSend,
        cameraPosition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Failure error)? error,
    TResult? Function()? noCity,
    TResult? Function(City city, num balance, List<DriveRouteEntity> routes,
            Set<Marker> markers, CameraPosition cameraPosition)?
        initialized,
    TResult? Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)?
        game,
  }) {
    return game?.call(
        status,
        city,
        balance,
        gameRoute,
        markers,
        polylines,
        timer,
        speed,
        dseconds,
        looseWin,
        distance,
        polylineAfter,
        secondsWithTapsMap,
        lastTapWasSend,
        cameraPosition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Failure error)? error,
    TResult Function()? noCity,
    TResult Function(City city, num balance, List<DriveRouteEntity> routes,
            Set<Marker> markers, CameraPosition cameraPosition)?
        initialized,
    TResult Function(
            GameStateType status,
            City city,
            num balance,
            DriveRouteEntity gameRoute,
            Set<Marker> markers,
            Set<Polyline> polylines,
            Timer? timer,
            num speed,
            int dseconds,
            LooseWinEntity? looseWin,
            double distance,
            Polyline? polylineAfter,
            Map<int, int> secondsWithTapsMap,
            bool lastTapWasSend,
            CameraPosition cameraPosition)?
        game,
    required TResult orElse(),
  }) {
    if (game != null) {
      return game(
          status,
          city,
          balance,
          gameRoute,
          markers,
          polylines,
          timer,
          speed,
          dseconds,
          looseWin,
          distance,
          polylineAfter,
          secondsWithTapsMap,
          lastTapWasSend,
          cameraPosition);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NoCity value) noCity,
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Game value) game,
  }) {
    return game(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NoCity value)? noCity,
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Game value)? game,
  }) {
    return game?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NoCity value)? noCity,
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Game value)? game,
    required TResult orElse(),
  }) {
    if (game != null) {
      return game(this);
    }
    return orElse();
  }
}

abstract class _Game implements GameState {
  const factory _Game(
      {final GameStateType status,
      required final City city,
      required final num balance,
      required final DriveRouteEntity gameRoute,
      final Set<Marker> markers,
      final Set<Polyline> polylines,
      final Timer? timer,
      final num speed,
      final int dseconds,
      final LooseWinEntity? looseWin,
      final double distance,
      final Polyline? polylineAfter,
      final Map<int, int> secondsWithTapsMap,
      final bool lastTapWasSend,
      final CameraPosition cameraPosition}) = _$GameImpl;

  GameStateType get status;
  City get city;
  num get balance;
  DriveRouteEntity get gameRoute;
  Set<Marker> get markers;
  Set<Polyline> get polylines;
  Timer? get timer;
  num get speed;
  int get dseconds;
  LooseWinEntity? get looseWin;
  double get distance;
  Polyline? get polylineAfter;
  Map<int, int> get secondsWithTapsMap;
  bool get lastTapWasSend;
  CameraPosition get cameraPosition;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
