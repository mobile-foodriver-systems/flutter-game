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
  CityList? get cityList => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  String? get searchText => throw _privateConstructorUsedError;

  /// Create a copy of CityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityStateCopyWith<CityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityStateCopyWith<$Res> {
  factory $CityStateCopyWith(CityState value, $Res Function(CityState) then) =
      _$CityStateCopyWithImpl<$Res, CityState>;
  @useResult
  $Res call(
      {ListStatus status,
      CityList? cityList,
      Failure? error,
      String? searchText});
}

/// @nodoc
class _$CityStateCopyWithImpl<$Res, $Val extends CityState>
    implements $CityStateCopyWith<$Res> {
  _$CityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cityList = freezed,
    Object? error = freezed,
    Object? searchText = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListStatus,
      cityList: freezed == cityList
          ? _value.cityList
          : cityList // ignore: cast_nullable_to_non_nullable
              as CityList?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {ListStatus status,
      CityList? cityList,
      Failure? error,
      String? searchText});
}

/// @nodoc
class __$$CityStateImplCopyWithImpl<$Res>
    extends _$CityStateCopyWithImpl<$Res, _$CityStateImpl>
    implements _$$CityStateImplCopyWith<$Res> {
  __$$CityStateImplCopyWithImpl(
      _$CityStateImpl _value, $Res Function(_$CityStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? cityList = freezed,
    Object? error = freezed,
    Object? searchText = freezed,
  }) {
    return _then(_$CityStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListStatus,
      cityList: freezed == cityList
          ? _value.cityList
          : cityList // ignore: cast_nullable_to_non_nullable
              as CityList?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      searchText: freezed == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CityStateImpl implements _CityState {
  const _$CityStateImpl(
      {this.status = ListStatus.initial,
      this.cityList = null,
      this.error = null,
      this.searchText = null});

  @override
  @JsonKey()
  final ListStatus status;
  @override
  @JsonKey()
  final CityList? cityList;
  @override
  @JsonKey()
  final Failure? error;
  @override
  @JsonKey()
  final String? searchText;

  @override
  String toString() {
    return 'CityState(status: $status, cityList: $cityList, error: $error, searchText: $searchText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cityList, cityList) ||
                other.cityList == cityList) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, cityList, error, searchText);

  /// Create a copy of CityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityStateImplCopyWith<_$CityStateImpl> get copyWith =>
      __$$CityStateImplCopyWithImpl<_$CityStateImpl>(this, _$identity);
}

abstract class _CityState implements CityState {
  const factory _CityState(
      {final ListStatus status,
      final CityList? cityList,
      final Failure? error,
      final String? searchText}) = _$CityStateImpl;

  @override
  ListStatus get status;
  @override
  CityList? get cityList;
  @override
  Failure? get error;
  @override
  String? get searchText;

  /// Create a copy of CityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityStateImplCopyWith<_$CityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
