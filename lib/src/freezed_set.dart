/*
 * Copyright (c) 2025. Vladimir E. Koltunov, mtbo.org
 * Please see the AUTHORS file for details.
 * All rights reserved. Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

import 'dart:collection' show UnmodifiableSetView;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_collection/src/internal/copy_on_write_set.dart'
    show CopyOnWriteSet;
import 'package:freezed_collection/src/internal/hash.dart' show hashObjects;
import 'package:freezed_collection/src/internal/iterables.dart'
    show evaluateIterable;

typedef $SetFactory<E> = Set<E> Function();

@Freezed(
    genericArgumentFactories: true,
    toJson: false,
    fromJson: false,
    copyWith: true)
abstract class FreezedSet<E> with _$FreezedSet<E> implements Iterable<E> {
  final $SetFactory<E>? __setFactory;

  final Set<E> __set;

  @override
  $SetFactory<E>? get setFactory => __setFactory;

  @override
  Set<E> get setInstance => __set;

  int? _hashCode;

  /// Instantiates with elements from an [Iterable].
  factory FreezedSet([Iterable iterable = const []]) =>
      FreezedSet.from(iterable);

  /// Instantiates with elements from an [Iterable].
  factory FreezedSet.from(Iterable iterable) {
    if (iterable is _FreezedSet && iterable.hasExactElementType(E)) {
      return iterable as FreezedSet<E>;
    } else {
      return _FreezedSet<E>.from(iterable);
    }
  }

  /// Instantiates with elements from an [Iterable<E>].
  factory FreezedSet.of(Iterable<E> iterable) {
    if (iterable is _FreezedSet<E> && iterable.hasExactElementType(E)) {
      return iterable;
    } else {
      return _FreezedSet<E>.of(iterable);
    }
  }

  //
  // /// Creates a [SetBuilder], applies updates to it, and builds.
  // factory FreezedSet.build(Function(SetBuilder<E>) updates) =>
  //     (SetBuilder<E>()..update(updates)).build();
  //
  // /// Converts to a [SetBuilder] for modification.
  // ///
  // /// The `FreezedSet` remains immutable and can continue to be used.
  // SetBuilder<E> toBuilder() =>
  //     SetBuilder<E>._fromFreezedSet(this as _FreezedSet<E>);
  //
  // /// Converts to a [SetBuilder], applies updates to it, and builds.
  // FreezedSet<E> rebuild(Function(SetBuilder<E>) updates) =>
  //     (toBuilder()..update(updates)).build();

  // @override
  // FreezedList<E> toFreezedList() => FreezedSet<E>(this);
  //
  // @override
  // FreezedSet<E> toFreezedSet() => this;

  /// Deep hashCode.
  ///
  /// A `FreezedSet` is only equal to another `FreezedSet` with equal elements in
  /// any order. Then, the `hashCode` is guaranteed to be the same.
  @override
  int get hashCode {
    _hashCode ??= hashObjects(
        setInstance.map((e) => e.hashCode).toList(growable: false)..sort());
    return _hashCode!;
  }

  /// Deep equality.
  ///
  /// A `FreezedSet` is only equal to another `FreezedSet` with equal elements in
  /// any order.
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FreezedSet) return false;
    if (other.length != length) return false;
    if (other.hashCode != hashCode) return false;
    return containsAll(other);
  }

  @override
  String toString() => setInstance.toString();

  /// Returns as an immutable set.
  ///
  /// Useful when producing or using APIs that need the [Set] interface. This
  /// differs from [toSet] where mutations are explicitly disallowed.
  Set<E> asSet() => UnmodifiableSetView<E>(setInstance);

  // Set.

  /// As [Set.length].
  @override
  int get length => setInstance.length;

  /// As [Set.containsAll].
  bool containsAll(Iterable<Object?> other) => setInstance.containsAll(other);

  /// As [Set.difference] but takes a `FreezedSet<Object?>` and returns a
  /// `FreezedSet<E>`.
  FreezedSet<E> difference(FreezedSet<Object?> other) =>
      _FreezedSet<E>.withSafeSet(
          setFactory, setInstance.difference(other.setInstance));

  /// As [Set.intersection] but takes a `FreezedSet<Object?>` and returns a
  /// `FreezedSet<E>`.
  FreezedSet<E> intersection(FreezedSet<Object?> other) =>
      _FreezedSet<E>.withSafeSet(
          setFactory, setInstance.intersection(other.setInstance));

  /// As [Set.lookup].
  E? lookup(Object? object) => setInstance.lookup(object);

  /// As [Set.union] but takes and returns a `FreezedSet<E>`.
  FreezedSet<E> union(FreezedSet<E> other) => _FreezedSet<E>.withSafeSet(
      setFactory, setInstance.union(other.setInstance));

  // Iterable.

  @override
  Iterator<E> get iterator => setInstance.iterator;

  @override
  Iterable<T> cast<T>() => Iterable.castFrom<E, T>(setInstance);

  @override
  Iterable<E> followedBy(Iterable<E> other) => setInstance.followedBy(other);

  @override
  Iterable<T> whereType<T>() => setInstance.whereType<T>();

  @override
  Iterable<T> map<T>(T Function(E) f) => setInstance.map(f);

  @override
  Iterable<E> where(bool Function(E) test) => setInstance.where(test);

  @override
  Iterable<T> expand<T>(Iterable<T> Function(E) f) => setInstance.expand(f);

  @override
  bool contains(Object? element) => setInstance.contains(element);

  @override
  void forEach(void Function(E) f) => setInstance.forEach(f);

  @override
  E reduce(E Function(E, E) combine) => setInstance.reduce(combine);

  @override
  T fold<T>(T initialValue, T Function(T, E) combine) =>
      setInstance.fold(initialValue, combine);

  @override
  bool every(bool Function(E) test) => setInstance.every(test);

  @override
  String join([String separator = '']) => setInstance.join(separator);

  @override
  bool any(bool Function(E) test) => setInstance.any(test);

  /// As [Iterable.toSet].
  ///
  /// Note that the implementation is efficient: it returns a copy-on-write
  /// wrapper around the data from this `FreezedSet`. So, if no mutations are
  /// made to the result, no copy is made.
  ///
  /// This allows efficient use of APIs that ask for a mutable collection
  /// but don't actually mutate it.
  @override
  Set<E> toSet() => CopyOnWriteSet<E>(setInstance, setFactory);

  @override
  List<E> toList({bool growable = true}) =>
      setInstance.toList(growable: growable);

  @override
  bool get isEmpty => setInstance.isEmpty;

  @override
  bool get isNotEmpty => setInstance.isNotEmpty;

  @override
  Iterable<E> take(int n) => setInstance.take(n);

  @override
  Iterable<E> takeWhile(bool Function(E) test) => setInstance.takeWhile(test);

  @override
  Iterable<E> skip(int n) => setInstance.skip(n);

  @override
  Iterable<E> skipWhile(bool Function(E) test) => setInstance.skipWhile(test);

  @override
  E get first => setInstance.first;

  @override
  E get last => setInstance.last;

  @override
  E get single => setInstance.single;

  @override
  E firstWhere(bool Function(E) test, {E Function()? orElse}) =>
      setInstance.firstWhere(test, orElse: orElse);

  @override
  E lastWhere(bool Function(E) test, {E Function()? orElse}) =>
      setInstance.lastWhere(test, orElse: orElse);

  @override
  E singleWhere(bool Function(E) test, {E Function()? orElse}) =>
      setInstance.singleWhere(test, orElse: orElse);

  @override
  E elementAt(int index) => setInstance.elementAt(index);

  // Internal.

  FreezedSet._(this.__setFactory, this.__set);

  factory FreezedSet.fromJson(
          List<dynamic> json, E Function(Object?) fromJsonE) =>
      FreezedSet(json.map(fromJsonE).toSet());

  List<dynamic> toJson() => setInstance.map((e) => e).toList();
}

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FreezedSet<E> {
  $SetFactory<E>? get setFactory;

  Set<E> get setInstance;

  /// Create a copy of FreezedSet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, FreezedSet<E>> get copyWith =>
      $FreezedSetCopyWith<E, FreezedSet<E>>(this as FreezedSet<E>, _$identity);
}

/// @nodoc
class _FreezedSet<E> extends FreezedSet<E> {
  _FreezedSet.withSafeSet(super.setFactory, super.set) : super._();

  _FreezedSet.from(Iterable iterable) : super._(null, Set<E>.from(iterable));

  _FreezedSet.of(Iterable<E> iterable) : super._(null, <E>{}..addAll(iterable));

  bool hasExactElementType(Type type) => E == type;
}

/// @nodoc
class $FreezedSetCopyWith<E, $Res> {
  factory $FreezedSetCopyWith(
      Iterable<E> iterable, $Res Function(FreezedSet<E>) then) {
    return $FreezedSetCopyWith<E, $Res>._uninitialized(then)..replace(iterable);
  }

  // factory $FreezedSetCopyWith.of(
  //     Iterable<E> iterable, $Res Function(Iterable<E> then) then) {
  //   return $FreezedSetCopyWith<E, $Res>._uninitialized(then)
  //     .._replaceOf(iterable);
  // }

  final $Res Function(FreezedSet<E>) _then;

  /// Used by [_createSet] to instantiate [_set]. The default value is `null`.
  $SetFactory<E>? _setFactory;
  late Set<E> _set;
  _FreezedSet<E>? _setOwner;

  /// Converts to a [FreezedSet].
  ///
  /// The `$FreezedSetCopyWith` can be modified again and used to create any number
  /// of `FreezedSet`s.
  $Res seal() {
    if (_setOwner == null) {
      _withOwner(_FreezedSet<E>.withSafeSet(_setFactory, _set));
    }
    return _then(FreezedSet(
      _setOwner ?? _set,
    ))!;
  }

  /// Applies a function to `this`.
  void update(Function($FreezedSetCopyWith<E, $Res>) updates) {
    updates(this);
  }

  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> call(Iterable set) {
    replace(set);
    return this;
  }

  /// Replaces all elements with elements from an [Iterable].
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> replace(Iterable iterable) {
    if (iterable is _FreezedSet<E> && iterable.setFactory == _setFactory) {
      _withOwner(iterable);
    } else {
      if (iterable is _FreezedSet<E>) {
        _setFactory = iterable.__setFactory;
      }
      final set = _createSet();
      for (final element in iterable) {
        if (element is E) {
          set.add(element);
        } else {
          throw ArgumentError('iterable contained invalid element: $element');
        }
      }
      _setSafeSet(set);
    }

    return this;
  }

  // /// Replaces all elements with elements from an [Iterable<E>].
  // @pragma('vm:prefer-inline')
  // $FreezedSetCopyWith<E, $Res> _replaceOf(Iterable<E> iterable) {
  //   if (iterable is _FreezedSet<E> && iterable.setFactory == _setFactory) {
  //     _withOwner(iterable);
  //   } else {
  //     if (iterable is _FreezedSet<E>) {
  //       _setFactory = iterable.__setFactory;
  //     }
  //     _setSafeSet(_createSet()..addAll(iterable));
  //   }
  //
  //   return this;
  // }

  /// Uses `base` as the collection type for all sets created by this builder.
  ///
  ///     // Iterates over elements in ascending order.
  ///     new $FreezedSetCopyWith<int>()..withBase(() => new SplayTreeSet<int>());
  ///
  ///     // Uses custom equality.
  ///     new $FreezedSetCopyWith<int>()..withBase(() => new LinkedHashSet<int>(
  ///         equals: (int a, int b) => a % 255 == b % 255,
  ///         hashCode: (int n) => (n % 255).hashCode));
  ///
  /// The set returned by `base` must be empty, mutable, and each call must
  /// instantiate and return a new object. The methods `difference`,
  /// `intersection` and `union` of the returned set must create sets of the
  /// same type.
  ///
  /// Use [withDefaultBase] to reset `base` to the default value.
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> withBase($SetFactory<E> base) {
    ArgumentError.checkNotNull(base, 'base');
    _setFactory = base;
    _setSafeSet(_createSet()..addAll(_set));

    return this;
  }

  /// As [withBase], but sets `base` back to the default value, which
  /// instantiates `Set<E>`.
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> withDefaultBase() {
    _setFactory = null;
    _setSafeSet(_createSet()..addAll(_set));
    return this;
  }

  // Based on Set.

  /// As [Set.length].
  int get length => _set.length;

  /// As [Set.isEmpty].
  bool get isEmpty => _set.isEmpty;

  /// As [Set.isNotEmpty].
  bool get isNotEmpty => _set.isNotEmpty;

  /// As [Set.add].
  bool add(E value) {
    return _safeSet.add(value);
  }

  /// As [Set.addAll].
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> addAll(Iterable<E> iterable) {
    iterable = evaluateIterable(iterable);
    _safeSet.addAll(iterable);
    return this;
  }

  /// As [Set.clear].
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> clear() {
    _safeSet.clear();
    return this;
  }

  /// As [Set.remove].
  bool remove(Object? value) => _safeSet.remove(value);

  /// As [Set.removeAll].
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> removeAll(Iterable<Object?> elements) {
    _safeSet.removeAll(elements);
    return this;
  }

  /// As [Set.removeWhere].
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> removeWhere(bool Function(E) test) {
    _safeSet.removeWhere(test);
    return this;
  }

  /// As [Set.retainAll].
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> retainAll(Iterable<Object?> elements) {
    _safeSet.retainAll(elements);
    return this;
  }

  /// As [Set.retainWhere].
  ///
  /// This method is an alias of [where].
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> retainWhere(bool Function(E) test) {
    _safeSet.retainWhere(test);
    return this;
  }

  // Based on Iterable.

  /// As [Iterable.map], but updates the builder in place. Returns nothing.
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> map(E Function(E) f) {
    final result = _createSet()..addAll(_set.map(f));
    _setSafeSet(result);
    return this;
  }

  /// As [Iterable.where], but updates the builder in place. Returns nothing.
  ///
  /// This method is an alias of [retainWhere].
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> where(bool Function(E) test) =>
      retainWhere(test);

  /// As [Iterable.expand], but updates the builder in place. Returns nothing.
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> expand(Iterable<E> Function(E) f) {
    final result = _createSet()..addAll(_set.expand(f));
    _setSafeSet(result);
    return this;
  }

  /// As [Iterable.take], but updates the builder in place. Returns nothing.
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> take(int n) {
    _setSafeSet(_createSet()..addAll(_set.take(n)));
    return this;
  }

  /// As [Iterable.takeWhile], but updates the builder in place. Returns
  /// nothing.
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> takeWhile(bool Function(E) test) {
    _setSafeSet(_createSet()..addAll(_set.takeWhile(test)));
    return this;
  }

  /// As [Iterable.skip], but updates the builder in place. Returns nothing.
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> skip(int n) {
    _setSafeSet(_createSet()..addAll(_set.skip(n)));
    return this;
  }

  /// As [Iterable.skipWhile], but updates the builder in place. Returns
  /// nothing.
  @pragma('vm:prefer-inline')
  $FreezedSetCopyWith<E, $Res> skipWhile(bool Function(E) test) {
    _setSafeSet(_createSet()..addAll(_set.skipWhile(test)));
    return this;
  }

  // Internal.

  $FreezedSetCopyWith._uninitialized(this._then);

  void _withOwner(_FreezedSet<E> setOwner) {
    assert(setOwner.setFactory == _setFactory,
        "Can't reuse a built set that uses a different base");
    _set = setOwner.setInstance;
    _setOwner = setOwner;
  }

  void _setSafeSet(Set<E> set) {
    _setOwner = null;
    _set = set;
  }

  Set<E> get _safeSet {
    if (_setOwner != null) {
      _set = _createSet()..addAll(_set);
      _setOwner = null;
    }
    return _set;
  }

  Set<E> _createSet() => _setFactory != null ? _setFactory!() : <E>{};
}

// dart format on
