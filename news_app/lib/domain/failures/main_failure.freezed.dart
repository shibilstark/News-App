// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainFailure {
  String get e => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String e, String type) clientFailure,
    required TResult Function(String e, String type) serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String e, String type)? clientFailure,
    TResult Function(String e, String type)? serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String e, String type)? clientFailure,
    TResult Function(String e, String type)? serverFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainFailureCopyWith<MainFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainFailureCopyWith<$Res> {
  factory $MainFailureCopyWith(
          MainFailure value, $Res Function(MainFailure) then) =
      _$MainFailureCopyWithImpl<$Res>;
  $Res call({String e, String type});
}

/// @nodoc
class _$MainFailureCopyWithImpl<$Res> implements $MainFailureCopyWith<$Res> {
  _$MainFailureCopyWithImpl(this._value, this._then);

  final MainFailure _value;
  // ignore: unused_field
  final $Res Function(MainFailure) _then;

  @override
  $Res call({
    Object? e = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      e: e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ClientFailureCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$_ClientFailureCopyWith(
          _$_ClientFailure value, $Res Function(_$_ClientFailure) then) =
      __$$_ClientFailureCopyWithImpl<$Res>;
  @override
  $Res call({String e, String type});
}

/// @nodoc
class __$$_ClientFailureCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res>
    implements _$$_ClientFailureCopyWith<$Res> {
  __$$_ClientFailureCopyWithImpl(
      _$_ClientFailure _value, $Res Function(_$_ClientFailure) _then)
      : super(_value, (v) => _then(v as _$_ClientFailure));

  @override
  _$_ClientFailure get _value => super._value as _$_ClientFailure;

  @override
  $Res call({
    Object? e = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_ClientFailure(
      e: e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ClientFailure implements _ClientFailure {
  const _$_ClientFailure({required this.e, required this.type});

  @override
  final String e;
  @override
  final String type;

  @override
  String toString() {
    return 'MainFailure.clientFailure(e: $e, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientFailure &&
            const DeepCollectionEquality().equals(other.e, e) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(e),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_ClientFailureCopyWith<_$_ClientFailure> get copyWith =>
      __$$_ClientFailureCopyWithImpl<_$_ClientFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String e, String type) clientFailure,
    required TResult Function(String e, String type) serverFailure,
  }) {
    return clientFailure(e, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String e, String type)? clientFailure,
    TResult Function(String e, String type)? serverFailure,
  }) {
    return clientFailure?.call(e, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String e, String type)? clientFailure,
    TResult Function(String e, String type)? serverFailure,
    required TResult orElse(),
  }) {
    if (clientFailure != null) {
      return clientFailure(e, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) {
    return clientFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
  }) {
    return clientFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (clientFailure != null) {
      return clientFailure(this);
    }
    return orElse();
  }
}

abstract class _ClientFailure implements MainFailure {
  const factory _ClientFailure(
      {required final String e, required final String type}) = _$_ClientFailure;

  @override
  String get e;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_ClientFailureCopyWith<_$_ClientFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ServerFailureCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$_ServerFailureCopyWith(
          _$_ServerFailure value, $Res Function(_$_ServerFailure) then) =
      __$$_ServerFailureCopyWithImpl<$Res>;
  @override
  $Res call({String e, String type});
}

/// @nodoc
class __$$_ServerFailureCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res>
    implements _$$_ServerFailureCopyWith<$Res> {
  __$$_ServerFailureCopyWithImpl(
      _$_ServerFailure _value, $Res Function(_$_ServerFailure) _then)
      : super(_value, (v) => _then(v as _$_ServerFailure));

  @override
  _$_ServerFailure get _value => super._value as _$_ServerFailure;

  @override
  $Res call({
    Object? e = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_ServerFailure(
      e: e == freezed
          ? _value.e
          : e // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ServerFailure implements _ServerFailure {
  const _$_ServerFailure({required this.e, required this.type});

  @override
  final String e;
  @override
  final String type;

  @override
  String toString() {
    return 'MainFailure.serverFailure(e: $e, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServerFailure &&
            const DeepCollectionEquality().equals(other.e, e) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(e),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$$_ServerFailureCopyWith<_$_ServerFailure> get copyWith =>
      __$$_ServerFailureCopyWithImpl<_$_ServerFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String e, String type) clientFailure,
    required TResult Function(String e, String type) serverFailure,
  }) {
    return serverFailure(e, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String e, String type)? clientFailure,
    TResult Function(String e, String type)? serverFailure,
  }) {
    return serverFailure?.call(e, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String e, String type)? clientFailure,
    TResult Function(String e, String type)? serverFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(e, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class _ServerFailure implements MainFailure {
  const factory _ServerFailure(
      {required final String e, required final String type}) = _$_ServerFailure;

  @override
  String get e;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_ServerFailureCopyWith<_$_ServerFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
