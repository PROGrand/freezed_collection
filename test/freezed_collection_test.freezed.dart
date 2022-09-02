// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_collection_test.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

One _$OneFromJson(Map<String, dynamic> json) {
  return _One.fromJson(json);
}

/// @nodoc
mixin _$One {
  String get name => throw _privateConstructorUsedError;
  Two get two => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OneCopyWith<One> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OneCopyWith<$Res> {
  factory $OneCopyWith(One value, $Res Function(One) then) =
      _$OneCopyWithImpl<$Res>;
  $Res call({String name, Two two});

  $TwoCopyWith<$Res> get two;
}

/// @nodoc
class _$OneCopyWithImpl<$Res> implements $OneCopyWith<$Res> {
  _$OneCopyWithImpl(this._value, this._then);

  final One _value;
  // ignore: unused_field
  final $Res Function(One) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? two = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      two: two == freezed
          ? _value.two
          : two // ignore: cast_nullable_to_non_nullable
              as Two,
    ));
  }

  @override
  $TwoCopyWith<$Res> get two {
    return $TwoCopyWith<$Res>(_value.two, (value) {
      return _then(_value.copyWith(two: value));
    });
  }
}

/// @nodoc
abstract class _$$_OneCopyWith<$Res> implements $OneCopyWith<$Res> {
  factory _$$_OneCopyWith(_$_One value, $Res Function(_$_One) then) =
      __$$_OneCopyWithImpl<$Res>;
  @override
  $Res call({String name, Two two});

  @override
  $TwoCopyWith<$Res> get two;
}

/// @nodoc
class __$$_OneCopyWithImpl<$Res> extends _$OneCopyWithImpl<$Res>
    implements _$$_OneCopyWith<$Res> {
  __$$_OneCopyWithImpl(_$_One _value, $Res Function(_$_One) _then)
      : super(_value, (v) => _then(v as _$_One));

  @override
  _$_One get _value => super._value as _$_One;

  @override
  $Res call({
    Object? name = freezed,
    Object? two = freezed,
  }) {
    return _then(_$_One(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      two == freezed
          ? _value.two
          : two // ignore: cast_nullable_to_non_nullable
              as Two,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_One implements _One {
  const _$_One(this.name, this.two);

  factory _$_One.fromJson(Map<String, dynamic> json) => _$$_OneFromJson(json);

  @override
  final String name;
  @override
  final Two two;

  @override
  String toString() {
    return 'One(name: $name, two: $two)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_One &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.two, two));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(two));

  @JsonKey(ignore: true)
  @override
  _$$_OneCopyWith<_$_One> get copyWith =>
      __$$_OneCopyWithImpl<_$_One>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OneToJson(
      this,
    );
  }
}

abstract class _One implements One {
  const factory _One(final String name, final Two two) = _$_One;

  factory _One.fromJson(Map<String, dynamic> json) = _$_One.fromJson;

  @override
  String get name;
  @override
  Two get two;
  @override
  @JsonKey(ignore: true)
  _$$_OneCopyWith<_$_One> get copyWith => throw _privateConstructorUsedError;
}

Two _$TwoFromJson(Map<String, dynamic> json) {
  return _Two.fromJson(json);
}

/// @nodoc
mixin _$Two {
  String get name => throw _privateConstructorUsedError;
  FreezedList<Three> get threes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TwoCopyWith<Two> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TwoCopyWith<$Res> {
  factory $TwoCopyWith(Two value, $Res Function(Two) then) =
      _$TwoCopyWithImpl<$Res>;
  $Res call({String name, FreezedList<Three> threes});

  $FreezedListCopyWith<Three, $Res> get threes;
}

/// @nodoc
class _$TwoCopyWithImpl<$Res> implements $TwoCopyWith<$Res> {
  _$TwoCopyWithImpl(this._value, this._then);

  final Two _value;
  // ignore: unused_field
  final $Res Function(Two) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? threes = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      threes: threes == freezed
          ? _value.threes
          : threes // ignore: cast_nullable_to_non_nullable
              as FreezedList<Three>,
    ));
  }

  @override
  $FreezedListCopyWith<Three, $Res> get threes {
    return $FreezedListCopyWith<Three, $Res>(_value.threes, (value) {
      return _then(_value.copyWith(threes: value));
    });
  }
}

/// @nodoc
abstract class _$$_TwoCopyWith<$Res> implements $TwoCopyWith<$Res> {
  factory _$$_TwoCopyWith(_$_Two value, $Res Function(_$_Two) then) =
      __$$_TwoCopyWithImpl<$Res>;
  @override
  $Res call({String name, FreezedList<Three> threes});

  @override
  $FreezedListCopyWith<Three, $Res> get threes;
}

/// @nodoc
class __$$_TwoCopyWithImpl<$Res> extends _$TwoCopyWithImpl<$Res>
    implements _$$_TwoCopyWith<$Res> {
  __$$_TwoCopyWithImpl(_$_Two _value, $Res Function(_$_Two) _then)
      : super(_value, (v) => _then(v as _$_Two));

  @override
  _$_Two get _value => super._value as _$_Two;

  @override
  $Res call({
    Object? name = freezed,
    Object? threes = freezed,
  }) {
    return _then(_$_Two(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      threes == freezed
          ? _value.threes
          : threes // ignore: cast_nullable_to_non_nullable
              as FreezedList<Three>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Two implements _Two {
  const _$_Two(this.name, this.threes);

  factory _$_Two.fromJson(Map<String, dynamic> json) => _$$_TwoFromJson(json);

  @override
  final String name;
  @override
  final FreezedList<Three> threes;

  @override
  String toString() {
    return 'Two(name: $name, threes: $threes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Two &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.threes, threes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(threes));

  @JsonKey(ignore: true)
  @override
  _$$_TwoCopyWith<_$_Two> get copyWith =>
      __$$_TwoCopyWithImpl<_$_Two>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TwoToJson(
      this,
    );
  }
}

abstract class _Two implements Two {
  const factory _Two(final String name, final FreezedList<Three> threes) =
      _$_Two;

  factory _Two.fromJson(Map<String, dynamic> json) = _$_Two.fromJson;

  @override
  String get name;
  @override
  FreezedList<Three> get threes;
  @override
  @JsonKey(ignore: true)
  _$$_TwoCopyWith<_$_Two> get copyWith => throw _privateConstructorUsedError;
}

Three _$ThreeFromJson(Map<String, dynamic> json) {
  return _Three.fromJson(json);
}

/// @nodoc
mixin _$Three {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThreeCopyWith<Three> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreeCopyWith<$Res> {
  factory $ThreeCopyWith(Three value, $Res Function(Three) then) =
      _$ThreeCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$ThreeCopyWithImpl<$Res> implements $ThreeCopyWith<$Res> {
  _$ThreeCopyWithImpl(this._value, this._then);

  final Three _value;
  // ignore: unused_field
  final $Res Function(Three) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ThreeCopyWith<$Res> implements $ThreeCopyWith<$Res> {
  factory _$$_ThreeCopyWith(_$_Three value, $Res Function(_$_Three) then) =
      __$$_ThreeCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$$_ThreeCopyWithImpl<$Res> extends _$ThreeCopyWithImpl<$Res>
    implements _$$_ThreeCopyWith<$Res> {
  __$$_ThreeCopyWithImpl(_$_Three _value, $Res Function(_$_Three) _then)
      : super(_value, (v) => _then(v as _$_Three));

  @override
  _$_Three get _value => super._value as _$_Three;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_Three(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Three implements _Three {
  const _$_Three(this.name);

  factory _$_Three.fromJson(Map<String, dynamic> json) =>
      _$$_ThreeFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'Three(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Three &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_ThreeCopyWith<_$_Three> get copyWith =>
      __$$_ThreeCopyWithImpl<_$_Three>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThreeToJson(
      this,
    );
  }
}

abstract class _Three implements Three {
  const factory _Three(final String name) = _$_Three;

  factory _Three.fromJson(Map<String, dynamic> json) = _$_Three.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_ThreeCopyWith<_$_Three> get copyWith =>
      throw _privateConstructorUsedError;
}

Collector _$CollectorFromJson(Map<String, dynamic> json) {
  return _Collector.fromJson(json);
}

/// @nodoc
mixin _$Collector {
  FreezedList<Numbers> get numbers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectorCopyWith<Collector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectorCopyWith<$Res> {
  factory $CollectorCopyWith(Collector value, $Res Function(Collector) then) =
      _$CollectorCopyWithImpl<$Res>;
  $Res call({FreezedList<Numbers> numbers});

  $FreezedListCopyWith<Numbers, $Res> get numbers;
}

/// @nodoc
class _$CollectorCopyWithImpl<$Res> implements $CollectorCopyWith<$Res> {
  _$CollectorCopyWithImpl(this._value, this._then);

  final Collector _value;
  // ignore: unused_field
  final $Res Function(Collector) _then;

  @override
  $Res call({
    Object? numbers = freezed,
  }) {
    return _then(_value.copyWith(
      numbers: numbers == freezed
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as FreezedList<Numbers>,
    ));
  }

  @override
  $FreezedListCopyWith<Numbers, $Res> get numbers {
    return $FreezedListCopyWith<Numbers, $Res>(_value.numbers, (value) {
      return _then(_value.copyWith(numbers: value));
    });
  }
}

/// @nodoc
abstract class _$$_CollectorCopyWith<$Res> implements $CollectorCopyWith<$Res> {
  factory _$$_CollectorCopyWith(
          _$_Collector value, $Res Function(_$_Collector) then) =
      __$$_CollectorCopyWithImpl<$Res>;
  @override
  $Res call({FreezedList<Numbers> numbers});

  @override
  $FreezedListCopyWith<Numbers, $Res> get numbers;
}

/// @nodoc
class __$$_CollectorCopyWithImpl<$Res> extends _$CollectorCopyWithImpl<$Res>
    implements _$$_CollectorCopyWith<$Res> {
  __$$_CollectorCopyWithImpl(
      _$_Collector _value, $Res Function(_$_Collector) _then)
      : super(_value, (v) => _then(v as _$_Collector));

  @override
  _$_Collector get _value => super._value as _$_Collector;

  @override
  $Res call({
    Object? numbers = freezed,
  }) {
    return _then(_$_Collector(
      numbers == freezed
          ? _value.numbers
          : numbers // ignore: cast_nullable_to_non_nullable
              as FreezedList<Numbers>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Collector implements _Collector {
  const _$_Collector(this.numbers);

  factory _$_Collector.fromJson(Map<String, dynamic> json) =>
      _$$_CollectorFromJson(json);

  @override
  final FreezedList<Numbers> numbers;

  @override
  String toString() {
    return 'Collector(numbers: $numbers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Collector &&
            const DeepCollectionEquality().equals(other.numbers, numbers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(numbers));

  @JsonKey(ignore: true)
  @override
  _$$_CollectorCopyWith<_$_Collector> get copyWith =>
      __$$_CollectorCopyWithImpl<_$_Collector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollectorToJson(
      this,
    );
  }
}

abstract class _Collector implements Collector {
  const factory _Collector(final FreezedList<Numbers> numbers) = _$_Collector;

  factory _Collector.fromJson(Map<String, dynamic> json) =
      _$_Collector.fromJson;

  @override
  FreezedList<Numbers> get numbers;
  @override
  @JsonKey(ignore: true)
  _$$_CollectorCopyWith<_$_Collector> get copyWith =>
      throw _privateConstructorUsedError;
}

Numbers _$NumbersFromJson(Map<String, dynamic> json) {
  return _Numbers.fromJson(json);
}

/// @nodoc
mixin _$Numbers {
  FreezedList<int> get values => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NumbersCopyWith<Numbers> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumbersCopyWith<$Res> {
  factory $NumbersCopyWith(Numbers value, $Res Function(Numbers) then) =
      _$NumbersCopyWithImpl<$Res>;
  $Res call({FreezedList<int> values});

  $FreezedListCopyWith<int, $Res> get values;
}

/// @nodoc
class _$NumbersCopyWithImpl<$Res> implements $NumbersCopyWith<$Res> {
  _$NumbersCopyWithImpl(this._value, this._then);

  final Numbers _value;
  // ignore: unused_field
  final $Res Function(Numbers) _then;

  @override
  $Res call({
    Object? values = freezed,
  }) {
    return _then(_value.copyWith(
      values: values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as FreezedList<int>,
    ));
  }

  @override
  $FreezedListCopyWith<int, $Res> get values {
    return $FreezedListCopyWith<int, $Res>(_value.values, (value) {
      return _then(_value.copyWith(values: value));
    });
  }
}

/// @nodoc
abstract class _$$_NumbersCopyWith<$Res> implements $NumbersCopyWith<$Res> {
  factory _$$_NumbersCopyWith(
          _$_Numbers value, $Res Function(_$_Numbers) then) =
      __$$_NumbersCopyWithImpl<$Res>;
  @override
  $Res call({FreezedList<int> values});

  @override
  $FreezedListCopyWith<int, $Res> get values;
}

/// @nodoc
class __$$_NumbersCopyWithImpl<$Res> extends _$NumbersCopyWithImpl<$Res>
    implements _$$_NumbersCopyWith<$Res> {
  __$$_NumbersCopyWithImpl(_$_Numbers _value, $Res Function(_$_Numbers) _then)
      : super(_value, (v) => _then(v as _$_Numbers));

  @override
  _$_Numbers get _value => super._value as _$_Numbers;

  @override
  $Res call({
    Object? values = freezed,
  }) {
    return _then(_$_Numbers(
      values == freezed
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as FreezedList<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Numbers implements _Numbers {
  const _$_Numbers(this.values);

  factory _$_Numbers.fromJson(Map<String, dynamic> json) =>
      _$$_NumbersFromJson(json);

  @override
  final FreezedList<int> values;

  @override
  String toString() {
    return 'Numbers(values: $values)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Numbers &&
            const DeepCollectionEquality().equals(other.values, values));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(values));

  @JsonKey(ignore: true)
  @override
  _$$_NumbersCopyWith<_$_Numbers> get copyWith =>
      __$$_NumbersCopyWithImpl<_$_Numbers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NumbersToJson(
      this,
    );
  }
}

abstract class _Numbers implements Numbers {
  const factory _Numbers(final FreezedList<int> values) = _$_Numbers;

  factory _Numbers.fromJson(Map<String, dynamic> json) = _$_Numbers.fromJson;

  @override
  FreezedList<int> get values;
  @override
  @JsonKey(ignore: true)
  _$$_NumbersCopyWith<_$_Numbers> get copyWith =>
      throw _privateConstructorUsedError;
}
