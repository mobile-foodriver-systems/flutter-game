// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountryState {
  ListStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountryStateCopyWith<CountryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryStateCopyWith<$Res> {
  factory $CountryStateCopyWith(
          CountryState value, $Res Function(CountryState) then) =
      _$CountryStateCopyWithImpl<$Res, CountryState>;
  @useResult
  $Res call({ListStatus status});
}

/// @nodoc
class _$CountryStateCopyWithImpl<$Res, $Val extends CountryState>
    implements $CountryStateCopyWith<$Res> {
  _$CountryStateCopyWithImpl(this._value, this._then);

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
abstract class _$$CountryStateImplCopyWith<$Res>
    implements $CountryStateCopyWith<$Res> {
  factory _$$CountryStateImplCopyWith(
          _$CountryStateImpl value, $Res Function(_$CountryStateImpl) then) =
      __$$CountryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ListStatus status});
}

/// @nodoc
class __$$CountryStateImplCopyWithImpl<$Res>
    extends _$CountryStateCopyWithImpl<$Res, _$CountryStateImpl>
    implements _$$CountryStateImplCopyWith<$Res> {
  __$$CountryStateImplCopyWithImpl(
      _$CountryStateImpl _value, $Res Function(_$CountryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$CountryStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListStatus,
    ));
  }
}

/// @nodoc

class _$CountryStateImpl implements _CountryState {
  const _$CountryStateImpl({this.status = ListStatus.initial});

  @override
  @JsonKey()
  final ListStatus status;

  @override
  String toString() {
    return 'CountryState(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryStateImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryStateImplCopyWith<_$CountryStateImpl> get copyWith =>
      __$$CountryStateImplCopyWithImpl<_$CountryStateImpl>(this, _$identity);
}

abstract class _CountryState implements CountryState {
  const factory _CountryState({final ListStatus status}) = _$CountryStateImpl;

  @override
  ListStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$CountryStateImplCopyWith<_$CountryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
