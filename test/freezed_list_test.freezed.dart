// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_list_test.dart';

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
  $OneCopyWith<One> get copyWith => _$OneCopyWithImpl<One>(this as One, _$identity);

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
  _$OneCopyWith<_One> get copyWith => __$OneCopyWithImpl<_One>(this, _$identity);

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
  factory _$OneCopyWith(_One value, $Res Function(_One) _then) = __$OneCopyWithImpl;
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
  String get name;
  FreezedList<Three> get threes;

  /// Create a copy of Two
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TwoCopyWith<Two> get copyWith => _$TwoCopyWithImpl<Two>(this as Two, _$identity);

  /// Serializes this Two to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Two &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.threes, threes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, const DeepCollectionEquality().hash(threes));

  @override
  String toString() {
    return 'Two(name: $name, threes: $threes)';
  }
}

/// @nodoc
abstract mixin class $TwoCopyWith<$Res> {
  factory $TwoCopyWith(Two value, $Res Function(Two) _then) = _$TwoCopyWithImpl;
  @useResult
  $Res call({String name, FreezedList<Three> threes});

  $FreezedListCopyWith<Three, $Res> get threes;
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
    Object? name = null,
    Object? threes = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      threes: null == threes
          ? _self.threes
          : threes // ignore: cast_nullable_to_non_nullable
              as FreezedList<Three>,
    ));
  }

  /// Create a copy of Two
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<Three, $Res> get threes {
    return $FreezedListCopyWith<Three, $Res>(_self.threes, (value) {
      return _then(_self.copyWith(threes: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Two implements Two {
  const _Two(this.name, this.threes);
  factory _Two.fromJson(Map<String, dynamic> json) => _$TwoFromJson(json);

  @override
  final String name;
  @override
  final FreezedList<Three> threes;

  /// Create a copy of Two
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TwoCopyWith<_Two> get copyWith => __$TwoCopyWithImpl<_Two>(this, _$identity);

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
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.threes, threes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, const DeepCollectionEquality().hash(threes));

  @override
  String toString() {
    return 'Two(name: $name, threes: $threes)';
  }
}

/// @nodoc
abstract mixin class _$TwoCopyWith<$Res> implements $TwoCopyWith<$Res> {
  factory _$TwoCopyWith(_Two value, $Res Function(_Two) _then) = __$TwoCopyWithImpl;
  @override
  @useResult
  $Res call({String name, FreezedList<Three> threes});

  @override
  $FreezedListCopyWith<Three, $Res> get threes;
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
    Object? name = null,
    Object? threes = null,
  }) {
    return _then(_Two(
      null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == threes
          ? _self.threes
          : threes // ignore: cast_nullable_to_non_nullable
              as FreezedList<Three>,
    ));
  }

  /// Create a copy of Two
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<Three, $Res> get threes {
    return $FreezedListCopyWith<Three, $Res>(_self.threes, (value) {
      return _then(_self.copyWith(threes: value));
    });
  }
}

/// @nodoc
mixin _$Three {
  String get name;

  /// Create a copy of Three
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ThreeCopyWith<Three> get copyWith => _$ThreeCopyWithImpl<Three>(this as Three, _$identity);

  /// Serializes this Three to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Three &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @override
  String toString() {
    return 'Three(name: $name)';
  }
}

/// @nodoc
abstract mixin class $ThreeCopyWith<$Res> {
  factory $ThreeCopyWith(Three value, $Res Function(Three) _then) = _$ThreeCopyWithImpl;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$ThreeCopyWithImpl<$Res> implements $ThreeCopyWith<$Res> {
  _$ThreeCopyWithImpl(this._self, this._then);

  final Three _self;
  final $Res Function(Three) _then;

  /// Create a copy of Three
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Three implements Three {
  const _Three(this.name);
  factory _Three.fromJson(Map<String, dynamic> json) => _$ThreeFromJson(json);

  @override
  final String name;

  /// Create a copy of Three
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ThreeCopyWith<_Three> get copyWith => __$ThreeCopyWithImpl<_Three>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ThreeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Three &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @override
  String toString() {
    return 'Three(name: $name)';
  }
}

/// @nodoc
abstract mixin class _$ThreeCopyWith<$Res> implements $ThreeCopyWith<$Res> {
  factory _$ThreeCopyWith(_Three value, $Res Function(_Three) _then) = __$ThreeCopyWithImpl;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$ThreeCopyWithImpl<$Res> implements _$ThreeCopyWith<$Res> {
  __$ThreeCopyWithImpl(this._self, this._then);

  final _Three _self;
  final $Res Function(_Three) _then;

  /// Create a copy of Three
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
  }) {
    return _then(_Three(
      null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Collector {
  FreezedList<Numbers> get numbers;

  /// Create a copy of Collector
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CollectorCopyWith<Collector> get copyWith =>
      _$CollectorCopyWithImpl<Collector>(this as Collector, _$identity);

  /// Serializes this Collector to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Collector &&
            const DeepCollectionEquality().equals(other.numbers, numbers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(numbers));

  @override
  String toString() {
    return 'Collector(numbers: $numbers)';
  }
}

/// @nodoc
abstract mixin class $CollectorCopyWith<$Res> {
  factory $CollectorCopyWith(Collector value, $Res Function(Collector) _then) =
      _$CollectorCopyWithImpl;
  @useResult
  $Res call({FreezedList<Numbers> numbers});

  $FreezedListCopyWith<Numbers, $Res> get numbers;
}

/// @nodoc
class _$CollectorCopyWithImpl<$Res> implements $CollectorCopyWith<$Res> {
  _$CollectorCopyWithImpl(this._self, this._then);

  final Collector _self;
  final $Res Function(Collector) _then;

  /// Create a copy of Collector
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numbers = null,
  }) {
    return _then(_self.copyWith(
      numbers: null == numbers
          ? _self.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as FreezedList<Numbers>,
    ));
  }

  /// Create a copy of Collector
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<Numbers, $Res> get numbers {
    return $FreezedListCopyWith<Numbers, $Res>(_self.numbers, (value) {
      return _then(_self.copyWith(numbers: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Collector implements Collector {
  const _Collector(this.numbers);
  factory _Collector.fromJson(Map<String, dynamic> json) => _$CollectorFromJson(json);

  @override
  final FreezedList<Numbers> numbers;

  /// Create a copy of Collector
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CollectorCopyWith<_Collector> get copyWith =>
      __$CollectorCopyWithImpl<_Collector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CollectorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Collector &&
            const DeepCollectionEquality().equals(other.numbers, numbers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(numbers));

  @override
  String toString() {
    return 'Collector(numbers: $numbers)';
  }
}

/// @nodoc
abstract mixin class _$CollectorCopyWith<$Res> implements $CollectorCopyWith<$Res> {
  factory _$CollectorCopyWith(_Collector value, $Res Function(_Collector) _then) =
      __$CollectorCopyWithImpl;
  @override
  @useResult
  $Res call({FreezedList<Numbers> numbers});

  @override
  $FreezedListCopyWith<Numbers, $Res> get numbers;
}

/// @nodoc
class __$CollectorCopyWithImpl<$Res> implements _$CollectorCopyWith<$Res> {
  __$CollectorCopyWithImpl(this._self, this._then);

  final _Collector _self;
  final $Res Function(_Collector) _then;

  /// Create a copy of Collector
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? numbers = null,
  }) {
    return _then(_Collector(
      null == numbers
          ? _self.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as FreezedList<Numbers>,
    ));
  }

  /// Create a copy of Collector
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<Numbers, $Res> get numbers {
    return $FreezedListCopyWith<Numbers, $Res>(_self.numbers, (value) {
      return _then(_self.copyWith(numbers: value));
    });
  }
}

/// @nodoc
mixin _$Numbers {
  FreezedList<int> get values;

  /// Create a copy of Numbers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NumbersCopyWith<Numbers> get copyWith =>
      _$NumbersCopyWithImpl<Numbers>(this as Numbers, _$identity);

  /// Serializes this Numbers to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Numbers &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(values));

  @override
  String toString() {
    return 'Numbers(values: $values)';
  }
}

/// @nodoc
abstract mixin class $NumbersCopyWith<$Res> {
  factory $NumbersCopyWith(Numbers value, $Res Function(Numbers) _then) = _$NumbersCopyWithImpl;
  @useResult
  $Res call({FreezedList<int> values});

  $FreezedListCopyWith<int, $Res> get values;
}

/// @nodoc
class _$NumbersCopyWithImpl<$Res> implements $NumbersCopyWith<$Res> {
  _$NumbersCopyWithImpl(this._self, this._then);

  final Numbers _self;
  final $Res Function(Numbers) _then;

  /// Create a copy of Numbers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
  }) {
    return _then(_self.copyWith(
      values: null == values
          ? _self.values
          : values // ignore: cast_nullable_to_non_nullable
              as FreezedList<int>,
    ));
  }

  /// Create a copy of Numbers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<int, $Res> get values {
    return $FreezedListCopyWith<int, $Res>(_self.values, (value) {
      return _then(_self.copyWith(values: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Numbers implements Numbers {
  const _Numbers(this.values);
  factory _Numbers.fromJson(Map<String, dynamic> json) => _$NumbersFromJson(json);

  @override
  final FreezedList<int> values;

  /// Create a copy of Numbers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NumbersCopyWith<_Numbers> get copyWith => __$NumbersCopyWithImpl<_Numbers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NumbersToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Numbers &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(values));

  @override
  String toString() {
    return 'Numbers(values: $values)';
  }
}

/// @nodoc
abstract mixin class _$NumbersCopyWith<$Res> implements $NumbersCopyWith<$Res> {
  factory _$NumbersCopyWith(_Numbers value, $Res Function(_Numbers) _then) = __$NumbersCopyWithImpl;
  @override
  @useResult
  $Res call({FreezedList<int> values});

  @override
  $FreezedListCopyWith<int, $Res> get values;
}

/// @nodoc
class __$NumbersCopyWithImpl<$Res> implements _$NumbersCopyWith<$Res> {
  __$NumbersCopyWithImpl(this._self, this._then);

  final _Numbers _self;
  final $Res Function(_Numbers) _then;

  /// Create a copy of Numbers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? values = null,
  }) {
    return _then(_Numbers(
      null == values
          ? _self.values
          : values // ignore: cast_nullable_to_non_nullable
              as FreezedList<int>,
    ));
  }

  /// Create a copy of Numbers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<int, $Res> get values {
    return $FreezedListCopyWith<int, $Res>(_self.values, (value) {
      return _then(_self.copyWith(values: value));
    });
  }
}

// dart format on
