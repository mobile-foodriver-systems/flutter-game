// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  AuthStatus get status => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;
  UserEntity? get user => throw _privateConstructorUsedError;
  Timer? get confirmationDataTimer => throw _privateConstructorUsedError;
  int get confirmationDataTimerSeconds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {AuthStatus status,
      Failure? error,
      UserEntity? user,
      Timer? confirmationDataTimer,
      int confirmationDataTimerSeconds});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? user = freezed,
    Object? confirmationDataTimer = freezed,
    Object? confirmationDataTimerSeconds = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      confirmationDataTimer: freezed == confirmationDataTimer
          ? _value.confirmationDataTimer
          : confirmationDataTimer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      confirmationDataTimerSeconds: null == confirmationDataTimerSeconds
          ? _value.confirmationDataTimerSeconds
          : confirmationDataTimerSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthStatus status,
      Failure? error,
      UserEntity? user,
      Timer? confirmationDataTimer,
      int confirmationDataTimerSeconds});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? user = freezed,
    Object? confirmationDataTimer = freezed,
    Object? confirmationDataTimerSeconds = null,
  }) {
    return _then(_$AuthStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      confirmationDataTimer: freezed == confirmationDataTimer
          ? _value.confirmationDataTimer
          : confirmationDataTimer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      confirmationDataTimerSeconds: null == confirmationDataTimerSeconds
          ? _value.confirmationDataTimerSeconds
          : confirmationDataTimerSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.status = AuthStatus.unknown,
      this.error = null,
      this.user = null,
      this.confirmationDataTimer = null,
      this.confirmationDataTimerSeconds = 0});

  @override
  @JsonKey()
  final AuthStatus status;
  @override
  @JsonKey()
  final Failure? error;
  @override
  @JsonKey()
  final UserEntity? user;
  @override
  @JsonKey()
  final Timer? confirmationDataTimer;
  @override
  @JsonKey()
  final int confirmationDataTimerSeconds;

  @override
  String toString() {
    return 'AuthState(status: $status, error: $error, user: $user, confirmationDataTimer: $confirmationDataTimer, confirmationDataTimerSeconds: $confirmationDataTimerSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.confirmationDataTimer, confirmationDataTimer) ||
                other.confirmationDataTimer == confirmationDataTimer) &&
            (identical(other.confirmationDataTimerSeconds,
                    confirmationDataTimerSeconds) ||
                other.confirmationDataTimerSeconds ==
                    confirmationDataTimerSeconds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error, user,
      confirmationDataTimer, confirmationDataTimerSeconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final AuthStatus status,
      final Failure? error,
      final UserEntity? user,
      final Timer? confirmationDataTimer,
      final int confirmationDataTimerSeconds}) = _$AuthStateImpl;

  @override
  AuthStatus get status;
  @override
  Failure? get error;
  @override
  UserEntity? get user;
  @override
  Timer? get confirmationDataTimer;
  @override
  int get confirmationDataTimerSeconds;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
