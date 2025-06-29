// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_map_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$One {
  String get name;
  Two get two;

  /// Create a copy of One
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OneCopyWith<One> get copyWith =>
      _$OneCopyWithImpl<One>(this as One, _$identity);

  /// Serializes this One to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is One &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.two, two) || other.two == two));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, two);

  @override
  String toString() {
    return 'One(name: $name, two: $two)';
  }
}

/// @nodoc
abstract mixin class $OneCopyWith<$Res> {
  factory $OneCopyWith(One value, $Res Function(One) _then) = _$OneCopyWithImpl;
  @useResult
  $Res call({String name, Two two});

  $TwoCopyWith<$Res> get two;
}

/// @nodoc
class _$OneCopyWithImpl<$Res> implements $OneCopyWith<$Res> {
  _$OneCopyWithImpl(this._self, this._then);

  final One _self;
  final $Res Function(One) _then;

  /// Create a copy of One
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? two = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      two: null == two
          ? _self.two
          : two // ignore: cast_nullable_to_non_nullable
              as Two,
    ));
  }

  /// Create a copy of One
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TwoCopyWith<$Res> get two {
    return $TwoCopyWith<$Res>(_self.two, (value) {
      return _then(_self.copyWith(two: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _One implements One {
  const _One(this.name, this.two);
  factory _One.fromJson(Map<String, dynamic> json) => _$OneFromJson(json);

  @override
  final String name;
  @override
  final Two two;

  /// Create a copy of One
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OneCopyWith<_One> get copyWith =>
      __$OneCopyWithImpl<_One>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OneToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _One &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.two, two) || other.two == two));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, two);

  @override
  String toString() {
    return 'One(name: $name, two: $two)';
  }
}

/// @nodoc
abstract mixin class _$OneCopyWith<$Res> implements $OneCopyWith<$Res> {
  factory _$OneCopyWith(_One value, $Res Function(_One) _then) =
      __$OneCopyWithImpl;
  @override
  @useResult
  $Res call({String name, Two two});

  @override
  $TwoCopyWith<$Res> get two;
}

/// @nodoc
class __$OneCopyWithImpl<$Res> implements _$OneCopyWith<$Res> {
  __$OneCopyWithImpl(this._self, this._then);

  final _One _self;
  final $Res Function(_One) _then;

  /// Create a copy of One
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? two = null,
  }) {
    return _then(_One(
      null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == two
          ? _self.two
          : two // ignore: cast_nullable_to_non_nullable
              as Two,
    ));
  }

  /// Create a copy of One
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TwoCopyWith<$Res> get two {
    return $TwoCopyWith<$Res>(_self.two, (value) {
      return _then(_self.copyWith(two: value));
    });
  }
}

/// @nodoc
mixin _$Two {
  int get index;
  FreezedMap<String, int> get three;

  /// Create a copy of Two
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TwoCopyWith<Two> get copyWith =>
      _$TwoCopyWithImpl<Two>(this as Two, _$identity);

  /// Serializes this Two to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Two &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.three, three) || other.three == three));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, index, three);

  @override
  String toString() {
    return 'Two(index: $index, three: $three)';
  }
}

/// @nodoc
abstract mixin class $TwoCopyWith<$Res> {
  factory $TwoCopyWith(Two value, $Res Function(Two) _then) = _$TwoCopyWithImpl;
  @useResult
  $Res call({int index, FreezedMap<String, int> three});

  $FreezedMapCopyWith<String, int, $Res> get three;
}

/// @nodoc
class _$TwoCopyWithImpl<$Res> implements $TwoCopyWith<$Res> {
  _$TwoCopyWithImpl(this._self, this._then);

  final Two _self;
  final $Res Function(Two) _then;

  /// Create a copy of Two
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? three = null,
  }) {
    return _then(_self.copyWith(
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      three: null == three
          ? _self.three
          : three // ignore: cast_nullable_to_non_nullable
              as FreezedMap<String, int>,
    ));
  }

  /// Create a copy of Two
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreezedMapCopyWith<String, int, $Res> get three {
    return $FreezedMapCopyWith<String, int, $Res>(_self.three, (value) {
      return _then(_self.copyWith(three: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Two implements Two {
  const _Two(this.index, this.three);
  factory _Two.fromJson(Map<String, dynamic> json) => _$TwoFromJson(json);

  @override
  final int index;
  @override
  final FreezedMap<String, int> three;

  /// Create a copy of Two
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TwoCopyWith<_Two> get copyWith =>
      __$TwoCopyWithImpl<_Two>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TwoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Two &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.three, three) || other.three == three));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, index, three);

  @override
  String toString() {
    return 'Two(index: $index, three: $three)';
  }
}

/// @nodoc
abstract mixin class _$TwoCopyWith<$Res> implements $TwoCopyWith<$Res> {
  factory _$TwoCopyWith(_Two value, $Res Function(_Two) _then) =
      __$TwoCopyWithImpl;
  @override
  @useResult
  $Res call({int index, FreezedMap<String, int> three});

  @override
  $FreezedMapCopyWith<String, int, $Res> get three;
}

/// @nodoc
class __$TwoCopyWithImpl<$Res> implements _$TwoCopyWith<$Res> {
  __$TwoCopyWithImpl(this._self, this._then);

  final _Two _self;
  final $Res Function(_Two) _then;

  /// Create a copy of Two
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
    Object? three = null,
  }) {
    return _then(_Two(
      null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == three
          ? _self.three
          : three // ignore: cast_nullable_to_non_nullable
              as FreezedMap<String, int>,
    ));
  }

  /// Create a copy of Two
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreezedMapCopyWith<String, int, $Res> get three {
    return $FreezedMapCopyWith<String, int, $Res>(_self.three, (value) {
      return _then(_self.copyWith(three: value));
    });
  }
}

/// @nodoc
mixin _$IntMap {
  int get index;
  FreezedMap<int, int> get map;

  /// Create a copy of IntMap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IntMapCopyWith<IntMap> get copyWith =>
      _$IntMapCopyWithImpl<IntMap>(this as IntMap, _$identity);

  /// Serializes this IntMap to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IntMap &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.map, map) || other.map == map));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, index, map);

  @override
  String toString() {
    return 'IntMap(index: $index, map: $map)';
  }
}

/// @nodoc
abstract mixin class $IntMapCopyWith<$Res> {
  factory $IntMapCopyWith(IntMap value, $Res Function(IntMap) _then) =
      _$IntMapCopyWithImpl;
  @useResult
  $Res call({int index, FreezedMap<int, int> map});

  $FreezedMapCopyWith<int, int, $Res> get map;
}

/// @nodoc
class _$IntMapCopyWithImpl<$Res> implements $IntMapCopyWith<$Res> {
  _$IntMapCopyWithImpl(this._self, this._then);

  final IntMap _self;
  final $Res Function(IntMap) _then;

  /// Create a copy of IntMap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? map = null,
  }) {
    return _then(_self.copyWith(
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      map: null == map
          ? _self.map
          : map // ignore: cast_nullable_to_non_nullable
              as FreezedMap<int, int>,
    ));
  }

  /// Create a copy of IntMap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreezedMapCopyWith<int, int, $Res> get map {
    return $FreezedMapCopyWith<int, int, $Res>(_self.map, (value) {
      return _then(_self.copyWith(map: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _IntMap implements IntMap {
  const _IntMap(this.index, this.map);
  factory _IntMap.fromJson(Map<String, dynamic> json) => _$IntMapFromJson(json);

  @override
  final int index;
  @override
  final FreezedMap<int, int> map;

  /// Create a copy of IntMap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IntMapCopyWith<_IntMap> get copyWith =>
      __$IntMapCopyWithImpl<_IntMap>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IntMapToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IntMap &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.map, map) || other.map == map));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, index, map);

  @override
  String toString() {
    return 'IntMap(index: $index, map: $map)';
  }
}

/// @nodoc
abstract mixin class _$IntMapCopyWith<$Res> implements $IntMapCopyWith<$Res> {
  factory _$IntMapCopyWith(_IntMap value, $Res Function(_IntMap) _then) =
      __$IntMapCopyWithImpl;
  @override
  @useResult
  $Res call({int index, FreezedMap<int, int> map});

  @override
  $FreezedMapCopyWith<int, int, $Res> get map;
}

/// @nodoc
class __$IntMapCopyWithImpl<$Res> implements _$IntMapCopyWith<$Res> {
  __$IntMapCopyWithImpl(this._self, this._then);

  final _IntMap _self;
  final $Res Function(_IntMap) _then;

  /// Create a copy of IntMap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
    Object? map = null,
  }) {
    return _then(_IntMap(
      null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == map
          ? _self.map
          : map // ignore: cast_nullable_to_non_nullable
              as FreezedMap<int, int>,
    ));
  }

  /// Create a copy of IntMap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreezedMapCopyWith<int, int, $Res> get map {
    return $FreezedMapCopyWith<int, int, $Res>(_self.map, (value) {
      return _then(_self.copyWith(map: value));
    });
  }
}

// dart format on
