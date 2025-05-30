// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'director.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Director {
  String? get name;
  FreezedMap<int, Assistant> get assistants;

  /// Create a copy of Director
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DirectorCopyWith<Director> get copyWith =>
      _$DirectorCopyWithImpl<Director>(this as Director, _$identity);

  /// Serializes this Director to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Director &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assistants, assistants) || other.assistants == assistants));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, assistants);

  @override
  String toString() {
    return 'Director(name: $name, assistants: $assistants)';
  }
}

/// @nodoc
abstract mixin class $DirectorCopyWith<$Res> {
  factory $DirectorCopyWith(Director value, $Res Function(Director) _then) = _$DirectorCopyWithImpl;
  @useResult
  $Res call({String? name, FreezedMap<int, Assistant> assistants});

  $FreezedMapCopyWith<int, Assistant, $Res> get assistants;
}

/// @nodoc
class _$DirectorCopyWithImpl<$Res> implements $DirectorCopyWith<$Res> {
  _$DirectorCopyWithImpl(this._self, this._then);

  final Director _self;
  final $Res Function(Director) _then;

  /// Create a copy of Director
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? assistants = null,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      assistants: null == assistants
          ? _self.assistants
          : assistants // ignore: cast_nullable_to_non_nullable
              as FreezedMap<int, Assistant>,
    ));
  }

  /// Create a copy of Director
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreezedMapCopyWith<int, Assistant, $Res> get assistants {
    return $FreezedMapCopyWith<int, Assistant, $Res>(_self.assistants, (value) {
      return _then(_self.copyWith(assistants: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Director implements Director {
  _Director({this.name, required this.assistants});
  factory _Director.fromJson(Map<String, dynamic> json) => _$DirectorFromJson(json);

  @override
  final String? name;
  @override
  final FreezedMap<int, Assistant> assistants;

  /// Create a copy of Director
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DirectorCopyWith<_Director> get copyWith =>
      __$DirectorCopyWithImpl<_Director>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DirectorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Director &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assistants, assistants) || other.assistants == assistants));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, assistants);

  @override
  String toString() {
    return 'Director(name: $name, assistants: $assistants)';
  }
}

/// @nodoc
abstract mixin class _$DirectorCopyWith<$Res> implements $DirectorCopyWith<$Res> {
  factory _$DirectorCopyWith(_Director value, $Res Function(_Director) _then) =
      __$DirectorCopyWithImpl;
  @override
  @useResult
  $Res call({String? name, FreezedMap<int, Assistant> assistants});

  @override
  $FreezedMapCopyWith<int, Assistant, $Res> get assistants;
}

/// @nodoc
class __$DirectorCopyWithImpl<$Res> implements _$DirectorCopyWith<$Res> {
  __$DirectorCopyWithImpl(this._self, this._then);

  final _Director _self;
  final $Res Function(_Director) _then;

  /// Create a copy of Director
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? assistants = null,
  }) {
    return _then(_Director(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      assistants: null == assistants
          ? _self.assistants
          : assistants // ignore: cast_nullable_to_non_nullable
              as FreezedMap<int, Assistant>,
    ));
  }

  /// Create a copy of Director
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreezedMapCopyWith<int, Assistant, $Res> get assistants {
    return $FreezedMapCopyWith<int, Assistant, $Res>(_self.assistants, (value) {
      return _then(_self.copyWith(assistants: value));
    });
  }
}

// dart format on
