/*
 * Copyright (c) 2025. Vladimir E. Koltunov, mtbo.org
 * Please see the AUTHORS file for details.
 * All rights reserved. Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

import 'dart:math' show Random;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_collection/src/internal/copy_on_write_list.dart';
import 'package:freezed_collection/src/internal/hash.dart' show hashObjects;
import 'package:freezed_collection/src/internal/iterables.dart' show evaluateIterable;

@Freezed(genericArgumentFactories: true, toJson: false, fromJson: false, copyWith: true)
abstract class FreezedList<E> with _$FreezedList<E> implements Iterable<E> {
  final List<E> _list;
  int? _hashCode;

  /// Instantiates with elements from an [Iterable].
  factory FreezedList([Iterable iterable = const []]) {
    if (iterable is _FreezedList && iterable.hasExactElementType(E)) {
      return iterable as FreezedList<E>;
    } else {
      return _FreezedList<E>.from(iterable);
    }
  }

  /// Instantiates with elements from an [Iterable<E>].
  ///
  /// `E` must not be `dynamic`.
  factory FreezedList.of(Iterable<E> iterable) {
    if (iterable is _FreezedList<E> && iterable.hasExactElementType(E)) {
      return iterable;
    } else {
      return _FreezedList<E>.of(iterable);
    }
  }

  /// Deep hashCode.
  ///
  /// A `FreezedList` is only equal to another `FreezedList` with equal elements in
  /// the same order. Then, the `hashCode` is guaranteed to be the same.
  @override
  int get hashCode {
    _hashCode ??= hashObjects(_list);
    return _hashCode!;
  }

  /// Deep equality.
  ///
  /// A `FreezedList` is only equal to another `FreezedList` with equal elements in
  /// the same order.
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FreezedList) return false;
    if (other.length != length) return false;
    if (other.hashCode != hashCode) return false;
    for (var i = 0; i != length; ++i) {
      if (other[i] != this[i]) return false;
    }
    return true;
  }

  @override
  String toString() => _list.toString();

  /// Returns as an immutable list.
  ///
  /// Useful when producing or using APIs that need the [List] interface. This
  /// differs from [toList] where mutations are explicitly disallowed.
  List<E> asList() => List<E>.unmodifiable(_list);

  // List.

  /// As [List.elementAt].
  E operator [](int index) => _list[index];

  /// As [List.+].
  FreezedList<E> operator +(FreezedList<E> other) =>
      _FreezedList<E>.withSafeList(_list + other._list);

  /// As [List.length].
  @override
  int get length => _list.length;

  /// As [List.reversed].
  Iterable<E> get reversed => _list.reversed;

  /// As [List.indexOf].
  int indexOf(E element, [int start = 0]) => _list.indexOf(element, start);

  /// As [List.lastIndexOf].
  int lastIndexOf(E element, [int? start]) => _list.lastIndexOf(element, start);

  /// As [List.indexWhere].
  int indexWhere(bool Function(E) test, [int start = 0]) => _list.indexWhere(test, start);

  /// As [List.lastIndexWhere].
  int lastIndexWhere(bool Function(E) test, [int? start]) => _list.lastIndexWhere(test, start);

  /// As [List.sublist] but returns a `FreezedList<E>`.
  FreezedList<E> sublist(int start, [int? end]) =>
      _FreezedList<E>.withSafeList(_list.sublist(start, end));

  /// As [List.getRange].
  Iterable<E> getRange(int start, int end) => _list.getRange(start, end);

  /// As [List.asMap].
  Map<int, E> asMap() => _list.asMap();

  // Iterable.

  @override
  Iterator<E> get iterator => _list.iterator;

  @override
  Iterable<T> map<T>(T Function(E) f) => _list.map(f);

  @override
  Iterable<E> where(bool Function(E) test) => _list.where(test);

  @override
  Iterable<T> whereType<T>() => _list.whereType<T>();

  @override
  Iterable<T> expand<T>(Iterable<T> Function(E) f) => _list.expand(f);

  @override
  bool contains(Object? element) => _list.contains(element);

  @override
  void forEach(void Function(E) f) => _list.forEach(f);

  @override
  E reduce(E Function(E, E) combine) => _list.reduce(combine);

  @override
  T fold<T>(T initialValue, T Function(T, E) combine) => _list.fold(initialValue, combine);

  @override
  Iterable<E> followedBy(Iterable<E> other) => _list.followedBy(other);

  @override
  bool every(bool Function(E) test) => _list.every(test);

  @override
  String join([String separator = '']) => _list.join(separator);

  @override
  bool any(bool Function(E) test) => _list.any(test);

  /// As [Iterable.toList].
  ///
  /// Note that the implementation is efficient: it returns a copy-on-write
  /// wrapper around the data from this `FreezedList`. So, if no mutations are
  /// made to the result, no copy is made.
  ///
  /// This allows efficient use of APIs that ask for a mutable collection
  /// but don't actually mutate it.
  @override
  List<E> toList({bool growable = true}) => CopyOnWriteList<E>(_list, growable);

  @override
  Set<E> toSet() => _list.toSet();

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  Iterable<E> take(int n) => _list.take(n);

  @override
  Iterable<E> takeWhile(bool Function(E) test) => _list.takeWhile(test);

  @override
  Iterable<E> skip(int n) => _list.skip(n);

  @override
  Iterable<E> skipWhile(bool Function(E) test) => _list.skipWhile(test);

  @override
  E get first => _list.first;

  @override
  E get last => _list.last;

  @override
  E get single => _list.single;

  @override
  E firstWhere(bool Function(E) test, {E Function()? orElse}) =>
      _list.firstWhere(test, orElse: orElse);

  @override
  E lastWhere(bool Function(E) test, {E Function()? orElse}) =>
      _list.lastWhere(test, orElse: orElse);

  @override
  E singleWhere(bool Function(E) test, {E Function()? orElse}) =>
      _list.singleWhere(test, orElse: orElse);

  @override
  E elementAt(int index) => _list.elementAt(index);

  @override
  Iterable<T> cast<T>() => Iterable.castFrom<E, T>(_list);

  // Internal.

  FreezedList._(this._list);

  //endregion

  factory FreezedList.fromJson(List<dynamic> json, E Function(Object?) fromJsonE) =>
      FreezedList(json.map(fromJsonE).toList());

  List<dynamic> toJson() => _list.map((e) => e).toList();
}

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
E _$identity<E>(E value) => value;

mixin _$FreezedList<E> {
  /// Create a copy of FreezedList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, FreezedList<E>> get copyWith =>
      $FreezedListCopyWith<E, FreezedList<E>>(this as FreezedList<E>, _$identity);
}

/// Default implementation of the public [FreezedMap] interface.
class _FreezedList<E> extends FreezedList<E> {
  _FreezedList.withSafeList(List<E> list) : super._(list);

  _FreezedList.from([Iterable iterable = const []])
      : super._(List<E>.from(iterable, growable: false));

  _FreezedList.of(Iterable<E> iterable) : super._(List<E>.from(iterable, growable: false));

  bool hasExactElementType(Type type) => E == type;
}

/// @nodoc
final class $FreezedListCopyWith<E, $Res> {
  /// Instantiates with elements from a [Map] or [FreezedMap].
  factory $FreezedListCopyWith(FreezedList<E> value, $Res Function(FreezedList<E>) then) {
    return $FreezedListCopyWith<E, $Res>._uninitialized(then)..replace(value);
  }

  // final FreezedList<E> _self;
  final $Res Function(FreezedList<E>) _then;

  late List<E> _list;
  _FreezedList<E>? _listOwner;

  /// Instantiates with elements from an [Iterable<E>].
  factory $FreezedListCopyWith.of(FreezedList<E> iterable, $Res Function(FreezedList<E>) then) {
    return $FreezedListCopyWith<E, $Res>._uninitialized(then).._replaceOf(iterable);
  }

  /// Converts to a [FreezedList].
  ///
  /// The `$FreezedListCopyWith` can be modified again and used to create any number
  /// of `FreezedList`s.
  $Res seal() {
    if (_listOwner == null) {
      _setOwner(_FreezedList<E>.withSafeList(_list));
    }
    return _then(FreezedList(
      _listOwner ?? _list,
    ))!;
  }

  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> call(Iterable? list) {
    replace(list);
    return this;
  }

  /// Applies a function to `this`.
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> update(Function($FreezedListCopyWith<E, $Res>) updates) {
    updates(this);
    return this;
  }

  /// Replaces all elements with elements from an [Iterable].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> replace(Iterable? iterable) {
    switch (iterable) {
      case _FreezedList<E> freezedList:
        _setOwner(freezedList);
      case Iterable it:
        _setSafeList(List<E>.from(it));
    }

    return this;
  }

  /// Replaces all elements with elements from an [Iterable<E>].
  void _replaceOf(Iterable<E> iterable) {
    if (iterable is _FreezedList<E>) {
      _setOwner(iterable);
    } else {
      _setSafeList(List<E>.of(iterable));
    }
  }

  // Based on List.

  /// As [List.elementAt].
  @pragma('vm:prefer-inline')
  E operator [](int index) => _list[index];

  /// As [List].
  @pragma('vm:prefer-inline')
  void operator []=(int index, E element) {
    _safeList[index] = element;
  }

  /// As [List.first].
  @pragma('vm:prefer-inline')
  E get first => _list.first;

  /// As [List.first].
  @pragma('vm:prefer-inline')
  set first(E value) => _safeList.first = value;

  /// As [List.last].
  @pragma('vm:prefer-inline')
  E get last => _list.last;

  /// As [List.last].
  @pragma('vm:prefer-inline')
  set last(E value) => _safeList.last = value;

  /// As [List.length].
  @pragma('vm:prefer-inline')
  int get length => _list.length;

  @pragma('vm:prefer-inline')
  set length(int value) => _safeList.length = value;

  /// As [List.isEmpty].
  @pragma('vm:prefer-inline')
  bool get isEmpty => _list.isEmpty;

  /// As [List.isNotEmpty].
  @pragma('vm:prefer-inline')
  bool get isNotEmpty => _list.isNotEmpty;

  /// As [List.add].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> add(E value) {
    _safeList.add(value);
    return this;
  }

  /// As [List.addAll].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> addAll(Iterable<E> iterable) {
    // Add directly to the underlying `List` then check elements there, for
    // performance. Roll back the changes if validation fails.
    var safeList = _safeList;
    safeList.addAll(iterable);
    return this;
  }

  /// As [List.reversed], but updates the builder in place. Returns nothing.
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> reverse() {
    _list = _list.reversed.toList(growable: true);
    _listOwner = null;
    return this;
  }

  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> replaceFirstWhere(E newElement, bool Function(E element) test) {
    final index = _safeList.indexWhere((element) => test(element));
    if (-1 != index) {
      _safeList[index] = newElement;
    }
    return this;
  }

  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> removeFirstWhere(bool Function(E element) test) {
    final index = _safeList.indexWhere((element) => test(element));
    if (-1 != index) {
      _safeList.removeAt(index);
    }
    return this;
  }

  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> setLast(E value) {
    _safeList.last = value;
    return this;
  }

  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> setLength(int newLength) {
    _safeList.length = newLength;
    return this;
  }

  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> setFirst(E value) {
    _safeList.first = value;
    return this;
  }

  /// As [List.sort].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> sort([int Function(E, E)? compare]) {
    _safeList.sort(compare);
    return this;
  }

  /// As [List.shuffle].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> shuffle([Random? random]) {
    _safeList.shuffle(random);
    return this;
  }

  /// As [List.clear].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> clear() {
    _safeList.clear();
    return this;
  }

  /// As [List.insert].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> insert(int index, E element) {
    _safeList.insert(index, element);
    return this;
  }

  /// As [List.insertAll].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> insertAll(int index, Iterable<E> iterable) {
    // Add directly to the underlying `List` then check elements there, for
    // performance. Roll back the changes if validation fails.
    var safeList = _safeList;
    safeList.insertAll(index, iterable);
    return this;
  }

  /// As [List.setAll].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> setAll(int index, Iterable<E> iterable) {
    iterable = evaluateIterable(iterable);
    _safeList.setAll(index, iterable);
    return this;
  }

  /// As [List.remove].
  @pragma('vm:prefer-inline')
  bool remove(Object? value) => _safeList.remove(value);

  /// As [List.removeAt].
  @pragma('vm:prefer-inline')
  E removeAt(int index) => _safeList.removeAt(index);

  /// As [List.removeLast].
  @pragma('vm:prefer-inline')
  E removeLast() => _safeList.removeLast();

  /// As [List.removeWhere].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> removeWhere(bool Function(E) test) {
    _safeList.removeWhere(test);
    return this;
  }

  /// As [List.retainWhere].
  ///
  /// This method is an alias of [where].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> retainWhere(bool Function(E) test) {
    _safeList.retainWhere(test);
    return this;
  }

  /// As [List.sublist], but updates the builder in place. Returns nothing.
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> sublist(int start, [int? end]) {
    _setSafeList(_list.sublist(start, end));
    return this;
  }

  /// As [List.setRange].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> setRange(int start, int end, Iterable<E> iterable,
      [int skipCount = 0]) {
    iterable = evaluateIterable(iterable);
    _safeList.setRange(start, end, iterable, skipCount);
    return this;
  }

  /// As [List.removeRange].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> removeRange(int start, int end) {
    _safeList.removeRange(start, end);
    return this;
  }

  /// As [List.fillRange], but requires a value.
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> fillRange(int start, int end, E fillValue) {
    _safeList.fillRange(start, end, fillValue);
    return this;
  }

  /// As [List.replaceRange].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> replaceRange(int start, int end, Iterable<E> iterable) {
    iterable = evaluateIterable(iterable);
    _safeList.replaceRange(start, end, iterable);
    return this;
  }

  // Based on Iterable.

  /// As [Iterable.map], but updates the builder in place. Returns nothing.
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> map(E Function(E) f) {
    var result = _list.map(f).toList(growable: true);
    _setSafeList(result);
    return this;
  }

  /// As [Iterable.where], but updates the builder in place. Returns nothing.
  ///
  /// This method is an alias of [retainWhere].
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> where(bool Function(E) test) => retainWhere(test);

  /// As [Iterable.expand], but updates the builder in place. Returns nothing.
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> expand(Iterable<E> Function(E) f) {
    var result = _list.expand(f).toList(growable: true);
    _setSafeList(result);
    return this;
  }

  /// As [Iterable.take], but updates the builder in place. Returns nothing.
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> take(int n) {
    _setSafeList(_list.take(n).toList(growable: true));
    return this;
  }

  /// As [Iterable.takeWhile], but updates the builder in place. Returns
  /// nothing.
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> takeWhile(bool Function(E) test) {
    _setSafeList(_list.takeWhile(test).toList(growable: true));
    return this;
  }

  /// As [Iterable.skip], but updates the builder in place. Returns nothing.
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> skip(int n) {
    _setSafeList(_list.skip(n).toList(growable: true));
    return this;
  }

  /// As [Iterable.skipWhile], but updates the builder in place. Returns
  /// nothing.
  @pragma('vm:prefer-inline')
  $FreezedListCopyWith<E, $Res> skipWhile(bool Function(E) test) {
    _setSafeList(_list.skipWhile(test).toList(growable: true));
    return this;
  }

  // Internal.

  $FreezedListCopyWith._uninitialized(this._then);

  void _setOwner(_FreezedList<E> listOwner) {
    _list = listOwner._list;
    _listOwner = listOwner;
  }

  void _setSafeList(List<E> list) {
    _list = list;
    _listOwner = null;
  }

  List<E> get _safeList {
    if (_listOwner != null) {
      _setSafeList(List<E>.from(_list, growable: true));
    }
    return _list;
  }
}
