// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CityState {
  ListStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CityStateCopyWith<CityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityStateCopyWith<$Res> {
  factory $CityStateCopyWith(CityState value, $Res Function(CityState) then) =
      _$CityStateCopyWithImpl<$Res, CityState>;
  @useResult
  $Res call({ListStatus status});
}

/// @nodoc
class _$CityStateCopyWithImpl<$Res, $Val extends CityState>
    implements $CityStateCopyWith<$Res> {
  _$CityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityStateImplCopyWith<$Res>
    implements $CityStateCopyWith<$Res> {
  factory _$$CityStateImplCopyWith(
          _$CityStateImpl value, $Res Function(_$CityStateImpl) then) =
      __$$CityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ListStatus status});
}

/// @nodoc
class __$$CityStateImplCopyWithImpl<$Res>
    extends _$CityStateCopyWithImpl<$Res, _$CityStateImpl>
    implements _$$CityStateImplCopyWith<$Res> {
  __$$CityStateImplCopyWithImpl(
      _$CityStateImpl _value, $Res Function(_$CityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$CityStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListStatus,
    ));
  }
}

/// @nodoc

class _$CityStateImpl implements _CityState {
  const _$CityStateImpl({this.status = ListStatus.initial});

  @override
  @JsonKey()
  final ListStatus status;

  @override
  String toString() {
    return 'CityState(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CityStateImplCopyWith<_$CityStateImpl> get copyWith =>
      __$$CityStateImplCopyWithImpl<_$CityStateImpl>(this, _$identity);
}

abstract class _CityState implements CityState {
  const factory _CityState({final ListStatus status}) = _$CityStateImpl;

  @override
  ListStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$CityStateImplCopyWith<_$CityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
