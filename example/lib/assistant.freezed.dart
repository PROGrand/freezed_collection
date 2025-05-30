// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assistant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Assistant {
  String get name;
  int get age;

  /// Create a copy of Assistant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AssistantCopyWith<Assistant> get copyWith =>
      _$AssistantCopyWithImpl<Assistant>(this as Assistant, _$identity);

  /// Serializes this Assistant to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Assistant &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, age);

  @override
  String toString() {
    return 'Assistant(name: $name, age: $age)';
  }
}

/// @nodoc
abstract mixin class $AssistantCopyWith<$Res> {
  factory $AssistantCopyWith(Assistant value, $Res Function(Assistant) _then) =
      _$AssistantCopyWithImpl;
  @useResult
  $Res call({String name, int age});
}

/// @nodoc
class _$AssistantCopyWithImpl<$Res> implements $AssistantCopyWith<$Res> {
  _$AssistantCopyWithImpl(this._self, this._then);

  final Assistant _self;
  final $Res Function(Assistant) _then;

  /// Create a copy of Assistant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? age = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Assistant implements Assistant {
  _Assistant({required this.name, required this.age});
  factory _Assistant.fromJson(Map<String, dynamic> json) => _$AssistantFromJson(json);

  @override
  final String name;
  @override
  final int age;

  /// Create a copy of Assistant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AssistantCopyWith<_Assistant> get copyWith =>
      __$AssistantCopyWithImpl<_Assistant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AssistantToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Assistant &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, age);

  @override
  String toString() {
    return 'Assistant(name: $name, age: $age)';
  }
}

/// @nodoc
abstract mixin class _$AssistantCopyWith<$Res> implements $AssistantCopyWith<$Res> {
  factory _$AssistantCopyWith(_Assistant value, $Res Function(_Assistant) _then) =
      __$AssistantCopyWithImpl;
  @override
  @useResult
  $Res call({String name, int age});
}

/// @nodoc
class __$AssistantCopyWithImpl<$Res> implements _$AssistantCopyWith<$Res> {
  __$AssistantCopyWithImpl(this._self, this._then);

  final _Assistant _self;
  final $Res Function(_Assistant) _then;

  /// Create a copy of Assistant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? age = null,
  }) {
    return _then(_Assistant(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
