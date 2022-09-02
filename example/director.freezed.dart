// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'director.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Director _$DirectorFromJson(Map<String, dynamic> json) {
  return _Director.fromJson(json);
}

/// @nodoc
mixin _$Director {
  String? get name => throw _privateConstructorUsedError;
  FreezedList<Assistant> get assistants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DirectorCopyWith<Director> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectorCopyWith<$Res> {
  factory $DirectorCopyWith(Director value, $Res Function(Director) then) =
      _$DirectorCopyWithImpl<$Res>;
  $Res call({String? name, FreezedList<Assistant> assistants});

  $FreezedListCopyWith<Assistant, $Res> get assistants;
}

/// @nodoc
class _$DirectorCopyWithImpl<$Res> implements $DirectorCopyWith<$Res> {
  _$DirectorCopyWithImpl(this._value, this._then);

  final Director _value;
  // ignore: unused_field
  final $Res Function(Director) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? assistants = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      assistants: assistants == freezed
          ? _value.assistants
          : assistants // ignore: cast_nullable_to_non_nullable
              as FreezedList<Assistant>,
    ));
  }

  @override
  $FreezedListCopyWith<Assistant, $Res> get assistants {
    return $FreezedListCopyWith<Assistant, $Res>(_value.assistants, (value) {
      return _then(_value.copyWith(assistants: value));
    });
  }
}

/// @nodoc
abstract class _$$_DirectorCopyWith<$Res> implements $DirectorCopyWith<$Res> {
  factory _$$_DirectorCopyWith(
          _$_Director value, $Res Function(_$_Director) then) =
      __$$_DirectorCopyWithImpl<$Res>;
  @override
  $Res call({String? name, FreezedList<Assistant> assistants});

  @override
  $FreezedListCopyWith<Assistant, $Res> get assistants;
}

/// @nodoc
class __$$_DirectorCopyWithImpl<$Res> extends _$DirectorCopyWithImpl<$Res>
    implements _$$_DirectorCopyWith<$Res> {
  __$$_DirectorCopyWithImpl(
      _$_Director _value, $Res Function(_$_Director) _then)
      : super(_value, (v) => _then(v as _$_Director));

  @override
  _$_Director get _value => super._value as _$_Director;

  @override
  $Res call({
    Object? name = freezed,
    Object? assistants = freezed,
  }) {
    return _then(_$_Director(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      assistants: assistants == freezed
          ? _value.assistants
          : assistants // ignore: cast_nullable_to_non_nullable
              as FreezedList<Assistant>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Director implements _Director {
  _$_Director({this.name, required this.assistants});

  factory _$_Director.fromJson(Map<String, dynamic> json) =>
      _$$_DirectorFromJson(json);

  @override
  final String? name;
  @override
  final FreezedList<Assistant> assistants;

  @override
  String toString() {
    return 'Director(name: $name, assistants: $assistants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Director &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.assistants, assistants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(assistants));

  @JsonKey(ignore: true)
  @override
  _$$_DirectorCopyWith<_$_Director> get copyWith =>
      __$$_DirectorCopyWithImpl<_$_Director>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DirectorToJson(
      this,
    );
  }
}

abstract class _Director implements Director {
  factory _Director(
      {final String? name,
      required final FreezedList<Assistant> assistants}) = _$_Director;

  factory _Director.fromJson(Map<String, dynamic> json) = _$_Director.fromJson;

  @override
  String? get name;
  @override
  FreezedList<Assistant> get assistants;
  @override
  @JsonKey(ignore: true)
  _$$_DirectorCopyWith<_$_Director> get copyWith =>
      throw _privateConstructorUsedError;
}
