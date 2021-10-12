// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'export_visitor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ExportVisitorStateTearOff {
  const _$ExportVisitorStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Exported exported(String message) {
    return Exported(
      message,
    );
  }

  Error error([String? message]) {
    return Error(
      message,
    );
  }
}

/// @nodoc
const $ExportVisitorState = _$ExportVisitorStateTearOff();

/// @nodoc
mixin _$ExportVisitorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) exported,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? exported,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Exported value) exported,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Exported value)? exported,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportVisitorStateCopyWith<$Res> {
  factory $ExportVisitorStateCopyWith(
          ExportVisitorState value, $Res Function(ExportVisitorState) then) =
      _$ExportVisitorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExportVisitorStateCopyWithImpl<$Res>
    implements $ExportVisitorStateCopyWith<$Res> {
  _$ExportVisitorStateCopyWithImpl(this._value, this._then);

  final ExportVisitorState _value;
  // ignore: unused_field
  final $Res Function(ExportVisitorState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$ExportVisitorStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'ExportVisitorState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) exported,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? exported,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Exported value) exported,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Exported value)? exported,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ExportVisitorState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $ExportedCopyWith<$Res> {
  factory $ExportedCopyWith(Exported value, $Res Function(Exported) then) =
      _$ExportedCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$ExportedCopyWithImpl<$Res>
    extends _$ExportVisitorStateCopyWithImpl<$Res>
    implements $ExportedCopyWith<$Res> {
  _$ExportedCopyWithImpl(Exported _value, $Res Function(Exported) _then)
      : super(_value, (v) => _then(v as Exported));

  @override
  Exported get _value => super._value as Exported;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(Exported(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Exported implements Exported {
  const _$Exported(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ExportVisitorState.exported(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Exported &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $ExportedCopyWith<Exported> get copyWith =>
      _$ExportedCopyWithImpl<Exported>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) exported,
    required TResult Function(String? message) error,
  }) {
    return exported(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? exported,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (exported != null) {
      return exported(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Exported value) exported,
    required TResult Function(Error value) error,
  }) {
    return exported(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Exported value)? exported,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (exported != null) {
      return exported(this);
    }
    return orElse();
  }
}

abstract class Exported implements ExportVisitorState {
  const factory Exported(String message) = _$Exported;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExportedCopyWith<Exported> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$ExportVisitorStateCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(Error(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'ExportVisitorState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message) exported,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message)? exported,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Exported value) exported,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Exported value)? exported,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements ExportVisitorState {
  const factory Error([String? message]) = _$Error;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}
