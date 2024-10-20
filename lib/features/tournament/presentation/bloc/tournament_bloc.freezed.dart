// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournament_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TournamentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(TournamentEntity tournament) tournament,
    required TResult Function(TournamentEntity tournament) finished,
    required TResult Function(Failure failure) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(TournamentEntity tournament)? tournament,
    TResult? Function(TournamentEntity tournament)? finished,
    TResult? Function(Failure failure)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(TournamentEntity tournament)? tournament,
    TResult Function(TournamentEntity tournament)? finished,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Tournament value) tournament,
    required TResult Function(_Finished value) finished,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Tournament value)? tournament,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Tournament value)? tournament,
    TResult Function(_Finished value)? finished,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentStateCopyWith<$Res> {
  factory $TournamentStateCopyWith(
          TournamentState value, $Res Function(TournamentState) then) =
      _$TournamentStateCopyWithImpl<$Res, TournamentState>;
}

/// @nodoc
class _$TournamentStateCopyWithImpl<$Res, $Val extends TournamentState>
    implements $TournamentStateCopyWith<$Res> {
  _$TournamentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TournamentState
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
    extends _$TournamentStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TournamentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'TournamentState.loading()';
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
    required TResult Function() empty,
    required TResult Function(TournamentEntity tournament) tournament,
    required TResult Function(TournamentEntity tournament) finished,
    required TResult Function(Failure failure) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(TournamentEntity tournament)? tournament,
    TResult? Function(TournamentEntity tournament)? finished,
    TResult? Function(Failure failure)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(TournamentEntity tournament)? tournament,
    TResult Function(TournamentEntity tournament)? finished,
    TResult Function(Failure failure)? error,
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
    required TResult Function(_Empty value) empty,
    required TResult Function(_Tournament value) tournament,
    required TResult Function(_Finished value) finished,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Tournament value)? tournament,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Tournament value)? tournament,
    TResult Function(_Finished value)? finished,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TournamentState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<$Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl value, $Res Function(_$EmptyImpl) then) =
      __$$EmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<$Res>
    extends _$TournamentStateCopyWithImpl<$Res, _$EmptyImpl>
    implements _$$EmptyImplCopyWith<$Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl _value, $Res Function(_$EmptyImpl) _then)
      : super(_value, _then);

  /// Create a copy of TournamentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmptyImpl implements _Empty {
  const _$EmptyImpl();

  @override
  String toString() {
    return 'TournamentState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(TournamentEntity tournament) tournament,
    required TResult Function(TournamentEntity tournament) finished,
    required TResult Function(Failure failure) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(TournamentEntity tournament)? tournament,
    TResult? Function(TournamentEntity tournament)? finished,
    TResult? Function(Failure failure)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(TournamentEntity tournament)? tournament,
    TResult Function(TournamentEntity tournament)? finished,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Tournament value) tournament,
    required TResult Function(_Finished value) finished,
    required TResult Function(_Error value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Tournament value)? tournament,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Error value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Tournament value)? tournament,
    TResult Function(_Finished value)? finished,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements TournamentState {
  const factory _Empty() = _$EmptyImpl;
}

/// @nodoc
abstract class _$$TournamentImplCopyWith<$Res> {
  factory _$$TournamentImplCopyWith(
          _$TournamentImpl value, $Res Function(_$TournamentImpl) then) =
      __$$TournamentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TournamentEntity tournament});
}

/// @nodoc
class __$$TournamentImplCopyWithImpl<$Res>
    extends _$TournamentStateCopyWithImpl<$Res, _$TournamentImpl>
    implements _$$TournamentImplCopyWith<$Res> {
  __$$TournamentImplCopyWithImpl(
      _$TournamentImpl _value, $Res Function(_$TournamentImpl) _then)
      : super(_value, _then);

  /// Create a copy of TournamentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tournament = null,
  }) {
    return _then(_$TournamentImpl(
      tournament: null == tournament
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as TournamentEntity,
    ));
  }
}

/// @nodoc

class _$TournamentImpl implements _Tournament {
  const _$TournamentImpl({required this.tournament});

  @override
  final TournamentEntity tournament;

  @override
  String toString() {
    return 'TournamentState.tournament(tournament: $tournament)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentImpl &&
            (identical(other.tournament, tournament) ||
                other.tournament == tournament));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tournament);

  /// Create a copy of TournamentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentImplCopyWith<_$TournamentImpl> get copyWith =>
      __$$TournamentImplCopyWithImpl<_$TournamentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(TournamentEntity tournament) tournament,
    required TResult Function(TournamentEntity tournament) finished,
    required TResult Function(Failure failure) error,
  }) {
    return tournament(this.tournament);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(TournamentEntity tournament)? tournament,
    TResult? Function(TournamentEntity tournament)? finished,
    TResult? Function(Failure failure)? error,
  }) {
    return tournament?.call(this.tournament);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(TournamentEntity tournament)? tournament,
    TResult Function(TournamentEntity tournament)? finished,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (tournament != null) {
      return tournament(this.tournament);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Tournament value) tournament,
    required TResult Function(_Finished value) finished,
    required TResult Function(_Error value) error,
  }) {
    return tournament(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Tournament value)? tournament,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Error value)? error,
  }) {
    return tournament?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Tournament value)? tournament,
    TResult Function(_Finished value)? finished,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (tournament != null) {
      return tournament(this);
    }
    return orElse();
  }
}

abstract class _Tournament implements TournamentState {
  const factory _Tournament({required final TournamentEntity tournament}) =
      _$TournamentImpl;

  TournamentEntity get tournament;

  /// Create a copy of TournamentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TournamentImplCopyWith<_$TournamentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FinishedImplCopyWith<$Res> {
  factory _$$FinishedImplCopyWith(
          _$FinishedImpl value, $Res Function(_$FinishedImpl) then) =
      __$$FinishedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TournamentEntity tournament});
}

/// @nodoc
class __$$FinishedImplCopyWithImpl<$Res>
    extends _$TournamentStateCopyWithImpl<$Res, _$FinishedImpl>
    implements _$$FinishedImplCopyWith<$Res> {
  __$$FinishedImplCopyWithImpl(
      _$FinishedImpl _value, $Res Function(_$FinishedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TournamentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tournament = null,
  }) {
    return _then(_$FinishedImpl(
      tournament: null == tournament
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as TournamentEntity,
    ));
  }
}

/// @nodoc

class _$FinishedImpl implements _Finished {
  const _$FinishedImpl({required this.tournament});

  @override
  final TournamentEntity tournament;

  @override
  String toString() {
    return 'TournamentState.finished(tournament: $tournament)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinishedImpl &&
            (identical(other.tournament, tournament) ||
                other.tournament == tournament));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tournament);

  /// Create a copy of TournamentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinishedImplCopyWith<_$FinishedImpl> get copyWith =>
      __$$FinishedImplCopyWithImpl<_$FinishedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(TournamentEntity tournament) tournament,
    required TResult Function(TournamentEntity tournament) finished,
    required TResult Function(Failure failure) error,
  }) {
    return finished(this.tournament);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(TournamentEntity tournament)? tournament,
    TResult? Function(TournamentEntity tournament)? finished,
    TResult? Function(Failure failure)? error,
  }) {
    return finished?.call(this.tournament);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(TournamentEntity tournament)? tournament,
    TResult Function(TournamentEntity tournament)? finished,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this.tournament);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Tournament value) tournament,
    required TResult Function(_Finished value) finished,
    required TResult Function(_Error value) error,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Tournament value)? tournament,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Error value)? error,
  }) {
    return finished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Tournament value)? tournament,
    TResult Function(_Finished value)? finished,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class _Finished implements TournamentState {
  const factory _Finished({required final TournamentEntity tournament}) =
      _$FinishedImpl;

  TournamentEntity get tournament;

  /// Create a copy of TournamentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinishedImplCopyWith<_$FinishedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$TournamentStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TournamentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$ErrorImpl(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.failure});

  @override
  final Failure failure;

  @override
  String toString() {
    return 'TournamentState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  /// Create a copy of TournamentState
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
    required TResult Function() empty,
    required TResult Function(TournamentEntity tournament) tournament,
    required TResult Function(TournamentEntity tournament) finished,
    required TResult Function(Failure failure) error,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(TournamentEntity tournament)? tournament,
    TResult? Function(TournamentEntity tournament)? finished,
    TResult? Function(Failure failure)? error,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(TournamentEntity tournament)? tournament,
    TResult Function(TournamentEntity tournament)? finished,
    TResult Function(Failure failure)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Tournament value) tournament,
    required TResult Function(_Finished value) finished,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Tournament value)? tournament,
    TResult? Function(_Finished value)? finished,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Empty value)? empty,
    TResult Function(_Tournament value)? tournament,
    TResult Function(_Finished value)? finished,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements TournamentState {
  const factory _Error({required final Failure failure}) = _$ErrorImpl;

  Failure get failure;

  /// Create a copy of TournamentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
