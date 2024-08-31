// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocalizationState {
  Locale get selectedLanguage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Locale selectedLanguage) $default, {
    required TResult Function(Locale selectedLanguage) initial,
    required TResult Function(Locale selectedLanguage) loading,
    required TResult Function(Locale selectedLanguage) error,
    required TResult Function(Locale selectedLanguage) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Locale selectedLanguage)? $default, {
    TResult? Function(Locale selectedLanguage)? initial,
    TResult? Function(Locale selectedLanguage)? loading,
    TResult? Function(Locale selectedLanguage)? error,
    TResult? Function(Locale selectedLanguage)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Locale selectedLanguage)? $default, {
    TResult Function(Locale selectedLanguage)? initial,
    TResult Function(Locale selectedLanguage)? loading,
    TResult Function(Locale selectedLanguage)? error,
    TResult Function(Locale selectedLanguage)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocalizationState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocalizationState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocalizationState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalizationStateCopyWith<LocalizationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationStateCopyWith<$Res> {
  factory $LocalizationStateCopyWith(
          LocalizationState value, $Res Function(LocalizationState) then) =
      _$LocalizationStateCopyWithImpl<$Res, LocalizationState>;
  @useResult
  $Res call({Locale selectedLanguage});
}

/// @nodoc
class _$LocalizationStateCopyWithImpl<$Res, $Val extends LocalizationState>
    implements $LocalizationStateCopyWith<$Res> {
  _$LocalizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLanguage = null,
  }) {
    return _then(_value.copyWith(
      selectedLanguage: null == selectedLanguage
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as Locale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalizationStateImplCopyWith<$Res>
    implements $LocalizationStateCopyWith<$Res> {
  factory _$$LocalizationStateImplCopyWith(_$LocalizationStateImpl value,
          $Res Function(_$LocalizationStateImpl) then) =
      __$$LocalizationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale selectedLanguage});
}

/// @nodoc
class __$$LocalizationStateImplCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$LocalizationStateImpl>
    implements _$$LocalizationStateImplCopyWith<$Res> {
  __$$LocalizationStateImplCopyWithImpl(_$LocalizationStateImpl _value,
      $Res Function(_$LocalizationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLanguage = null,
  }) {
    return _then(_$LocalizationStateImpl(
      selectedLanguage: null == selectedLanguage
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$LocalizationStateImpl implements _LocalizationState {
  const _$LocalizationStateImpl({this.selectedLanguage = const Locale('en')});

  @override
  @JsonKey()
  final Locale selectedLanguage;

  @override
  String toString() {
    return 'LocalizationState(selectedLanguage: $selectedLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizationStateImpl &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                other.selectedLanguage == selectedLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizationStateImplCopyWith<_$LocalizationStateImpl> get copyWith =>
      __$$LocalizationStateImplCopyWithImpl<_$LocalizationStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Locale selectedLanguage) $default, {
    required TResult Function(Locale selectedLanguage) initial,
    required TResult Function(Locale selectedLanguage) loading,
    required TResult Function(Locale selectedLanguage) error,
    required TResult Function(Locale selectedLanguage) success,
  }) {
    return $default(selectedLanguage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Locale selectedLanguage)? $default, {
    TResult? Function(Locale selectedLanguage)? initial,
    TResult? Function(Locale selectedLanguage)? loading,
    TResult? Function(Locale selectedLanguage)? error,
    TResult? Function(Locale selectedLanguage)? success,
  }) {
    return $default?.call(selectedLanguage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Locale selectedLanguage)? $default, {
    TResult Function(Locale selectedLanguage)? initial,
    TResult Function(Locale selectedLanguage)? loading,
    TResult Function(Locale selectedLanguage)? error,
    TResult Function(Locale selectedLanguage)? success,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(selectedLanguage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocalizationState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocalizationState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocalizationState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _LocalizationState implements LocalizationState {
  const factory _LocalizationState({final Locale selectedLanguage}) =
      _$LocalizationStateImpl;

  @override
  Locale get selectedLanguage;
  @override
  @JsonKey(ignore: true)
  _$$LocalizationStateImplCopyWith<_$LocalizationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $LocalizationStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale selectedLanguage});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLanguage = null,
  }) {
    return _then(_$InitialImpl(
      selectedLanguage: null == selectedLanguage
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.selectedLanguage = const Locale('en')});

  @override
  @JsonKey()
  final Locale selectedLanguage;

  @override
  String toString() {
    return 'LocalizationState.initial(selectedLanguage: $selectedLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                other.selectedLanguage == selectedLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Locale selectedLanguage) $default, {
    required TResult Function(Locale selectedLanguage) initial,
    required TResult Function(Locale selectedLanguage) loading,
    required TResult Function(Locale selectedLanguage) error,
    required TResult Function(Locale selectedLanguage) success,
  }) {
    return initial(selectedLanguage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Locale selectedLanguage)? $default, {
    TResult? Function(Locale selectedLanguage)? initial,
    TResult? Function(Locale selectedLanguage)? loading,
    TResult? Function(Locale selectedLanguage)? error,
    TResult? Function(Locale selectedLanguage)? success,
  }) {
    return initial?.call(selectedLanguage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Locale selectedLanguage)? $default, {
    TResult Function(Locale selectedLanguage)? initial,
    TResult Function(Locale selectedLanguage)? loading,
    TResult Function(Locale selectedLanguage)? error,
    TResult Function(Locale selectedLanguage)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(selectedLanguage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocalizationState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocalizationState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocalizationState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LocalizationState {
  const factory _Initial({final Locale selectedLanguage}) = _$InitialImpl;

  @override
  Locale get selectedLanguage;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $LocalizationStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale selectedLanguage});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLanguage = null,
  }) {
    return _then(_$LoadingImpl(
      selectedLanguage: null == selectedLanguage
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl({this.selectedLanguage = const Locale('en')});

  @override
  @JsonKey()
  final Locale selectedLanguage;

  @override
  String toString() {
    return 'LocalizationState.loading(selectedLanguage: $selectedLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                other.selectedLanguage == selectedLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Locale selectedLanguage) $default, {
    required TResult Function(Locale selectedLanguage) initial,
    required TResult Function(Locale selectedLanguage) loading,
    required TResult Function(Locale selectedLanguage) error,
    required TResult Function(Locale selectedLanguage) success,
  }) {
    return loading(selectedLanguage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Locale selectedLanguage)? $default, {
    TResult? Function(Locale selectedLanguage)? initial,
    TResult? Function(Locale selectedLanguage)? loading,
    TResult? Function(Locale selectedLanguage)? error,
    TResult? Function(Locale selectedLanguage)? success,
  }) {
    return loading?.call(selectedLanguage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Locale selectedLanguage)? $default, {
    TResult Function(Locale selectedLanguage)? initial,
    TResult Function(Locale selectedLanguage)? loading,
    TResult Function(Locale selectedLanguage)? error,
    TResult Function(Locale selectedLanguage)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(selectedLanguage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocalizationState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocalizationState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocalizationState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LocalizationState {
  const factory _Loading({final Locale selectedLanguage}) = _$LoadingImpl;

  @override
  Locale get selectedLanguage;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res>
    implements $LocalizationStateCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale selectedLanguage});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLanguage = null,
  }) {
    return _then(_$ErrorImpl(
      selectedLanguage: null == selectedLanguage
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({this.selectedLanguage = const Locale('en')});

  @override
  @JsonKey()
  final Locale selectedLanguage;

  @override
  String toString() {
    return 'LocalizationState.error(selectedLanguage: $selectedLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                other.selectedLanguage == selectedLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Locale selectedLanguage) $default, {
    required TResult Function(Locale selectedLanguage) initial,
    required TResult Function(Locale selectedLanguage) loading,
    required TResult Function(Locale selectedLanguage) error,
    required TResult Function(Locale selectedLanguage) success,
  }) {
    return error(selectedLanguage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Locale selectedLanguage)? $default, {
    TResult? Function(Locale selectedLanguage)? initial,
    TResult? Function(Locale selectedLanguage)? loading,
    TResult? Function(Locale selectedLanguage)? error,
    TResult? Function(Locale selectedLanguage)? success,
  }) {
    return error?.call(selectedLanguage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Locale selectedLanguage)? $default, {
    TResult Function(Locale selectedLanguage)? initial,
    TResult Function(Locale selectedLanguage)? loading,
    TResult Function(Locale selectedLanguage)? error,
    TResult Function(Locale selectedLanguage)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(selectedLanguage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocalizationState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocalizationState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocalizationState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements LocalizationState {
  const factory _Error({final Locale selectedLanguage}) = _$ErrorImpl;

  @override
  Locale get selectedLanguage;
  @override
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $LocalizationStateCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale selectedLanguage});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLanguage = null,
  }) {
    return _then(_$SuccessImpl(
      selectedLanguage: null == selectedLanguage
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({this.selectedLanguage = const Locale('en')});

  @override
  @JsonKey()
  final Locale selectedLanguage;

  @override
  String toString() {
    return 'LocalizationState.success(selectedLanguage: $selectedLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                other.selectedLanguage == selectedLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(Locale selectedLanguage) $default, {
    required TResult Function(Locale selectedLanguage) initial,
    required TResult Function(Locale selectedLanguage) loading,
    required TResult Function(Locale selectedLanguage) error,
    required TResult Function(Locale selectedLanguage) success,
  }) {
    return success(selectedLanguage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Locale selectedLanguage)? $default, {
    TResult? Function(Locale selectedLanguage)? initial,
    TResult? Function(Locale selectedLanguage)? loading,
    TResult? Function(Locale selectedLanguage)? error,
    TResult? Function(Locale selectedLanguage)? success,
  }) {
    return success?.call(selectedLanguage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Locale selectedLanguage)? $default, {
    TResult Function(Locale selectedLanguage)? initial,
    TResult Function(Locale selectedLanguage)? loading,
    TResult Function(Locale selectedLanguage)? error,
    TResult Function(Locale selectedLanguage)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(selectedLanguage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocalizationState value) $default, {
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocalizationState value)? $default, {
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocalizationState value)? $default, {
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements LocalizationState {
  const factory _Success({final Locale selectedLanguage}) = _$SuccessImpl;

  @override
  Locale get selectedLanguage;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
