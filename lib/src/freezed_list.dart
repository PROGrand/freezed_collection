import 'dart:math' show Random;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_collection/src/internal/copy_on_write_list.dart';

@Freezed(
    genericArgumentFactories: true,
    toJson: false,
    fromJson: false,
    copyWith: true)
class FreezedList<T> with _$FreezedList<T> implements Iterable<T> {
  const FreezedList([this.list = const []]);

  @override
  final List<T> list;

  // factory FreezedList([Iterable iterable = const []]) =>
  //     FreezedList<T>.of(List<T>.from(iterable, growable: false));

  // const factory FreezedList.of(List<T> list) = _FreezedList<T>;

  @override
  String toString() => list.toString();

  // region List
  /// Returns as an immutable list.
  ///
  /// Useful when producing or using APIs that need the [List] interface. This
  /// differs from [toList] where mutations are explicitly disallowed.
  List<T> asList() => List<T>.unmodifiable(list);

  // List.

  /// As [List.elementAt].
  T operator [](int index) => list[index];

  /// As [List.+].
  FreezedList<T> operator +(FreezedList<T> other) =>
      FreezedList<T>(list + other.list);

  /// As [List.length].
  @override
  int get length => list.length;

  /// As [List.reversed].
  Iterable<T> get reversed => list.reversed;

  /// As [List.indexOf].
  int indexOf(T element, [int start = 0]) => list.indexOf(element, start);

  /// As [List.lastIndexOf].
  int lastIndexOf(T element, [int? start]) => list.lastIndexOf(element, start);

  /// As [List.indexWhere].
  int indexWhere(bool Function(T) test, [int start = 0]) =>
      list.indexWhere(test, start);

  /// As [List.lastIndexWhere].
  int lastIndexWhere(bool Function(T) test, [int? start]) =>
      list.lastIndexWhere(test, start);

  /// As [List.sublist] but returns a `FreezedList<T>`.
  FreezedList<T> sublist(int start, [int? end]) =>
      FreezedList<T>(list.sublist(start, end));

  /// As [List.getRange].
  Iterable<T> getRange(int start, int end) => list.getRange(start, end);

  /// As [List.asMap].
  Map<int, T> asMap() => list.asMap();

  // endregion

  //region Iterable
  @override
  Iterator<T> get iterator => list.iterator;

  @override
  Iterable<E> map<E>(E Function(T) f) => list.map(f);

  @override
  Iterable<T> where(bool Function(T) test) => list.where(test);

  @override
  Iterable<E> whereType<E>() => list.whereType<E>();

  @override
  Iterable<E> expand<E>(Iterable<E> Function(T) f) => list.expand(f);

  @override
  bool contains(Object? element) => list.contains(element);

  @override
  void forEach(void Function(T) f) => list.forEach(f);

  @override
  T reduce(T Function(T, T) combine) => list.reduce(combine);

  @override
  E fold<E>(E initialValue, E Function(E, T) combine) =>
      list.fold(initialValue, combine);

  @override
  Iterable<T> followedBy(Iterable<T> other) => list.followedBy(other);

  @override
  bool every(bool Function(T) test) => list.every(test);

  @override
  String join([String separator = '']) => list.join(separator);

  @override
  bool any(bool Function(T) test) => list.any(test);

  /// As [Iterable.toList].
  ///
  /// Note that the implementation is efficient: it returns a copy-on-write
  /// wrapper around the data from this `FreezedList`. So, if no mutations are
  /// made to the result, no copy is made.
  ///
  /// This allows efficient use of APIs that ask for a mutable collection
  /// but don't actually mutate it.
  @override
  List<T> toList({bool growable = true}) => CopyOnWriteList<T>(list, growable);

  @override
  Set<T> toSet() => list.toSet();

  @override
  bool get isEmpty => list.isEmpty;

  @override
  bool get isNotEmpty => list.isNotEmpty;

  @override
  Iterable<T> take(int n) => list.take(n);

  @override
  Iterable<T> takeWhile(bool Function(T) test) => list.takeWhile(test);

  @override
  Iterable<T> skip(int n) => list.skip(n);

  @override
  Iterable<T> skipWhile(bool Function(T) test) => list.skipWhile(test);

  @override
  T get first => list.first;

  @override
  T get last => list.last;

  @override
  T get single => list.single;

  @override
  T firstWhere(bool Function(T) test, {T Function()? orElse}) =>
      list.firstWhere(test, orElse: orElse);

  @override
  T lastWhere(bool Function(T) test, {T Function()? orElse}) =>
      list.lastWhere(test, orElse: orElse);

  @override
  T singleWhere(bool Function(T) test, {T Function()? orElse}) =>
      list.singleWhere(test, orElse: orElse);

  @override
  T elementAt(int index) => list.elementAt(index);

  @override
  Iterable<E> cast<E>() => Iterable.castFrom<T, E>(list);

  //endregion

  factory FreezedList.fromJson(
          List<dynamic> json, T Function(Object?) fromJsonT) =>
      FreezedList(json.map(fromJsonT).toList());

  List<dynamic> toJson() => list.map((e) => e).toList();
}

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FreezedList<T> {
  List<T> get list;

  /// Create a copy of FreezedList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<T, FreezedList<T>> get copyWith =>
      _$FreezedListCopyWithImpl<T, FreezedList<T>>(
          this as FreezedList<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FreezedList<T> &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));
}

/// @nodoc
abstract mixin class $FreezedListCopyWith<T, $Res> {
  factory $FreezedListCopyWith(
          FreezedList<T> value, $Res Function(FreezedList<T>) then) =
      _$FreezedListCopyWithImpl;

  @useResult
  $Res call({Object? list});

  @useResult
  $Res replaceFirstWhere(T newElement, bool Function(T element) test);

  @useResult
  $Res removeFirstWhere(bool Function(T element) test);

  @useResult
  $Res set(int index, T element);

  @useResult
  $Res add(T value);

  @useResult
  $Res addAll(Iterable<T> iterable);

  @useResult
  $Res clear();

  @useResult
  $Res fillRange(int start, int end, [T? fillValue]);

  @useResult
  $Res setFirst(T value);

  @useResult
  $Res insert(int index, T element);

  @useResult
  $Res insertAll(int index, Iterable<T> iterable);

  @useResult
  $Res setLast(T value);

  @useResult
  $Res setLength(int newLength);

  @useResult
  $Res remove(Object? value);

  @useResult
  $Res removeAt(int index);

  @useResult
  $Res removeLast();

  @useResult
  $Res removeRange(int start, int end);

  @useResult
  $Res removeWhere(bool Function(T element) test);

  @useResult
  $Res replaceRange(int start, int end, Iterable<T> replacements);

  @useResult
  $Res retainWhere(bool Function(T element) test);

  @useResult
  $Res setAll(int index, Iterable<T> iterable);

  @useResult
  $Res setRange(int start, int end, Iterable<T> iterable, [int skipCount = 0]);

  @useResult
  $Res shuffle([Random? random]);

  @useResult
  $Res sort([int Function(T a, T b)? compare]);
}

/// @nodoc
class _$FreezedListCopyWithImpl<T, $Res>
    implements $FreezedListCopyWith<T, $Res> {
  _$FreezedListCopyWithImpl(this._self, this._then);

  final FreezedList<T> _self;
  final $Res Function(FreezedList<T>) _then;

  /// Create a copy of FreezedList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list,
  }) {
    return _then(FreezedList(
      null == list
          ? _self.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res replaceFirstWhere(T newElement, bool Function(T element) test) {
    final index = _self.list.indexWhere((element) => test(element));
    if (-1 != index) {
      var newList = _self.list.toList();
      newList[index] = newElement;
      return _then(FreezedList<T>(newList));
    } else {
      return _then(FreezedList<T>(_self.list));
    }
  }

  @pragma('vm:prefer-inline')
  @override
  $Res removeFirstWhere(bool Function(T element) test) {
    final index = _self.list.indexWhere((element) => test(element));
    if (-1 != index) {
      var newList = _self.list.toList();
      newList.removeAt(index);
      return _then(FreezedList<T>(newList));
    } else {
      return _then(FreezedList<T>(_self.list));
    }
  }

  @pragma('vm:prefer-inline')
  @override
  $Res set(int index, T element) {
    var newList = _self.list.toList();
    newList[index] = element;
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res add(T value) {
    var newList = _self.list.toList();
    newList.add(value);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res addAll(Iterable<T> iterable) {
    var newList = _self.list.toList();
    newList.addAll(iterable);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res clear() {
    return _then(FreezedList<T>([]));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res fillRange(int start, int end, [T? fillValue]) {
    var newList = _self.list.toList();
    newList.fillRange(start, end, fillValue);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res setFirst(T value) {
    var newList = _self.list.toList();
    newList.first = value;
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res insert(int index, T element) {
    var newList = _self.list.toList();
    newList.insert(index, element);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res insertAll(int index, Iterable<T> iterable) {
    var newList = _self.list.toList();
    newList.insertAll(index, iterable);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res setLast(T value) {
    var newList = _self.list.toList();
    newList.last = value;
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res setLength(int newLength) {
    var newList = _self.list.toList();
    newList.length = newLength;
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res remove(Object? value) {
    var newList = _self.list.toList();
    newList.remove(value);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res removeAt(int index) {
    var newList = _self.list.toList();
    newList.removeAt(index);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res removeLast() {
    var newList = _self.list.toList();
    newList.removeLast();
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res removeRange(int start, int end) {
    var newList = _self.list.toList();
    newList.removeRange(start, end);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res removeWhere(bool Function(T element) test) {
    var newList = _self.list.toList();
    newList.removeWhere(test);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res replaceRange(int start, int end, Iterable<T> replacements) {
    var newList = _self.list.toList();
    newList.replaceRange(start, end, replacements);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res retainWhere(bool Function(T element) test) {
    var newList = _self.list.toList();
    newList.retainWhere(test);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res setAll(int index, Iterable<T> iterable) {
    var newList = _self.list.toList();
    newList.setAll(index, iterable);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res setRange(int start, int end, Iterable<T> iterable, [int skipCount = 0]) {
    var newList = _self.list.toList();
    newList.setRange(start, end, iterable, skipCount);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res shuffle([Random? random]) {
    var newList = _self.list.toList();
    newList.shuffle(random);
    return _then(FreezedList<T>(newList));
  }

  @pragma('vm:prefer-inline')
  @override
  $Res sort([int Function(T a, T b)? compare]) {
    var newList = _self.list.toList();
    newList.sort(compare);
    return _then(FreezedList<T>(newList));
  }
}
