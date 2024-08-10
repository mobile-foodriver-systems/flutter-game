// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseLocationState {
  ListStatus get status => throw _privateConstructorUsedError;
  ApiList<Selectable>? get apiList => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  String? get searchText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BaseLocationStateCopyWith<BaseLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseLocationStateCopyWith<$Res> {
  factory $BaseLocationStateCopyWith(
          BaseLocationState value, $Res Function(BaseLocationState) then) =
      _$BaseLocationStateCopyWithImpl<$Res, BaseLocationState>;
  @useResult
  $Res call(
      {ListStatus status,
      ApiList<Selectable>? apiList,
      Failure? error,
      String? searchText});
}

/// @nodoc
class _$BaseLocationStateCopyWithImpl<$Res, $Val extends BaseLocationState>
    implements $BaseLocationStateCopyWith<$Res> {
  _$BaseLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? apiList = freezed,
    Object? error = freezed,
    Object? searchText = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListStatus,
      apiList: freezed == apiList
          ? _value.apiList
          : apiList // ignore: cast_nullable_to_non_nullable
              as ApiList<Selectable>?,
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
abstract class _$$BaseLocationStateImplCopyWith<$Res>
    implements $BaseLocationStateCopyWith<$Res> {
  factory _$$BaseLocationStateImplCopyWith(_$BaseLocationStateImpl value,
          $Res Function(_$BaseLocationStateImpl) then) =
      __$$BaseLocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ListStatus status,
      ApiList<Selectable>? apiList,
      Failure? error,
      String? searchText});
}

/// @nodoc
class __$$BaseLocationStateImplCopyWithImpl<$Res>
    extends _$BaseLocationStateCopyWithImpl<$Res, _$BaseLocationStateImpl>
    implements _$$BaseLocationStateImplCopyWith<$Res> {
  __$$BaseLocationStateImplCopyWithImpl(_$BaseLocationStateImpl _value,
      $Res Function(_$BaseLocationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? apiList = freezed,
    Object? error = freezed,
    Object? searchText = freezed,
  }) {
    return _then(_$BaseLocationStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ListStatus,
      apiList: freezed == apiList
          ? _value.apiList
          : apiList // ignore: cast_nullable_to_non_nullable
              as ApiList<Selectable>?,
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

class _$BaseLocationStateImpl implements _BaseLocationState {
  const _$BaseLocationStateImpl(
      {this.status = ListStatus.initial,
      this.apiList = null,
      this.error = null,
      this.searchText = null});

  @override
  @JsonKey()
  final ListStatus status;
  @override
  @JsonKey()
  final ApiList<Selectable>? apiList;
  @override
  @JsonKey()
  final Failure? error;
  @override
  @JsonKey()
  final String? searchText;

  @override
  String toString() {
    return 'BaseLocationState(status: $status, apiList: $apiList, error: $error, searchText: $searchText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseLocationStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.apiList, apiList) || other.apiList == apiList) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, apiList, error, searchText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseLocationStateImplCopyWith<_$BaseLocationStateImpl> get copyWith =>
      __$$BaseLocationStateImplCopyWithImpl<_$BaseLocationStateImpl>(
          this, _$identity);
}

abstract class _BaseLocationState implements BaseLocationState {
  const factory _BaseLocationState(
      {final ListStatus status,
      final ApiList<Selectable>? apiList,
      final Failure? error,
      final String? searchText}) = _$BaseLocationStateImpl;

  @override
  ListStatus get status;
  @override
  ApiList<Selectable>? get apiList;
  @override
  Failure? get error;
  @override
  String? get searchText;
  @override
  @JsonKey(ignore: true)
  _$$BaseLocationStateImplCopyWith<_$BaseLocationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
