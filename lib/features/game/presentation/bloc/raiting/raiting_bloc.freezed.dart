// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raiting_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RaitingState {
  ListStatus get status => throw _privateConstructorUsedError;
  UsersSortType get sort => throw _privateConstructorUsedError;
  RaitingList? get raitingList => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RaitingStateCopyWith<RaitingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RaitingStateCopyWith<$Res> {
  factory $RaitingStateCopyWith(
          RaitingState value, $Res Function(RaitingState) then) =
      _$RaitingStateCopyWithImpl<$Res, RaitingState>;
  @useResult
  $Res call(
      {ListStatus status,
      UsersSortType sort,
      RaitingList? raitingList,
      Failure? error});
}

/// @nodoc
class _$RaitingStateCopyWithImpl<$Res, $Val extends RaitingState>
    implements $RaitingStateCopyWith<$Res> {
  _$RaitingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sort = null,
    Object? raitingList = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListStatus,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as UsersSortType,
      raitingList: freezed == raitingList
          ? _value.raitingList
          : raitingList // ignore: cast_nullable_to_non_nullable
              as RaitingList?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RaitingStateImplCopyWith<$Res>
    implements $RaitingStateCopyWith<$Res> {
  factory _$$RaitingStateImplCopyWith(
          _$RaitingStateImpl value, $Res Function(_$RaitingStateImpl) then) =
      __$$RaitingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ListStatus status,
      UsersSortType sort,
      RaitingList? raitingList,
      Failure? error});
}

/// @nodoc
class __$$RaitingStateImplCopyWithImpl<$Res>
    extends _$RaitingStateCopyWithImpl<$Res, _$RaitingStateImpl>
    implements _$$RaitingStateImplCopyWith<$Res> {
  __$$RaitingStateImplCopyWithImpl(
      _$RaitingStateImpl _value, $Res Function(_$RaitingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? sort = null,
    Object? raitingList = freezed,
    Object? error = freezed,
  }) {
    return _then(_$RaitingStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListStatus,
      sort: null == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as UsersSortType,
      raitingList: freezed == raitingList
          ? _value.raitingList
          : raitingList // ignore: cast_nullable_to_non_nullable
              as RaitingList?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$RaitingStateImpl implements _RaitingState {
  const _$RaitingStateImpl(
      {this.status = ListStatus.initial,
      this.sort = UsersSortType.global,
      this.raitingList = null,
      this.error = null});

  @override
  @JsonKey()
  final ListStatus status;
  @override
  @JsonKey()
  final UsersSortType sort;
  @override
  @JsonKey()
  final RaitingList? raitingList;
  @override
  @JsonKey()
  final Failure? error;

  @override
  String toString() {
    return 'RaitingState(status: $status, sort: $sort, raitingList: $raitingList, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RaitingStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.raitingList, raitingList) ||
                other.raitingList == raitingList) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, sort, raitingList, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RaitingStateImplCopyWith<_$RaitingStateImpl> get copyWith =>
      __$$RaitingStateImplCopyWithImpl<_$RaitingStateImpl>(this, _$identity);
}

abstract class _RaitingState implements RaitingState {
  const factory _RaitingState(
      {final ListStatus status,
      final UsersSortType sort,
      final RaitingList? raitingList,
      final Failure? error}) = _$RaitingStateImpl;

  @override
  ListStatus get status;
  @override
  UsersSortType get sort;
  @override
  RaitingList? get raitingList;
  @override
  Failure? get error;
  @override
  @JsonKey(ignore: true)
  _$$RaitingStateImplCopyWith<_$RaitingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
