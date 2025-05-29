// ignore_for_file: override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_collection/src/internal/copy_on_write_map.dart'
    show CopyOnWriteMap;
import 'package:freezed_collection/src/internal/hash.dart'
    show hashObjects, hash2;
import 'package:freezed_collection/src/internal/null_safety.dart';

typedef $MapFactory<K, V> = Map<K, V> Function();

@Freezed(
    genericArgumentFactories: true,
    toJson: false,
    fromJson: false,
    copyWith: true)
abstract class FreezedMap<K, V> with _$FreezedMap {
  @override
  final $MapFactory<K, V>? _mapFactory;

  @override
  final Map<K, V> _map;

  // Cached.
  int? _hashCode;
  Iterable<K>? _keys;
  Iterable<V>? _values;

  /// Instantiates with elements from a [Map] or [FreezedMap].
  factory FreezedMap([dynamic map = const {}]) {
    if (map is _FreezedMap && map.hasExactKeyAndValueTypes(K, V)) {
      return map as FreezedMap<K, V>;
    } else if (map is Map || map is FreezedMap) {
      return _FreezedMap<K, V>.copyAndCheckTypes(map.keys, (k) => map[k]);
    } else {
      throw ArgumentError('expected Map or FreezedMap, got ${map.runtimeType}');
    }
  }

  /// Instantiates with elements from a [Map].
  factory FreezedMap.from(Map map) {
    return _FreezedMap<K, V>.copyAndCheckTypes(map.keys, (k) => map[k]);
  }

  /// Instantiates with elements from a [Map<K, V>].
  ///
  /// `K` and `V` are inferred from `map`.
  factory FreezedMap.of(Map<K, V> map) {
    return _FreezedMap<K, V>.copyAndCheckForNull(map.keys, (k) => map[k] as V);
  }

  /// Returns as an immutable map.
  ///
  /// Useful when producing or using APIs that need the [Map] interface. This
  /// differs from [toMap] where mutations are explicitly disallowed.
  Map<K, V> asMap() => Map<K, V>.unmodifiable(_map);

  /// Converts to a [Map].
  ///
  /// Note that the implementation is efficient: it returns a copy-on-write
  /// wrapper around the data from this `FreezedMap`. So, if no mutations are
  /// made to the result, no copy is made.
  ///
  /// This allows efficient use of APIs that ask for a mutable collection
  /// but don't actually mutate it.
  Map<K, V> toMap() => CopyOnWriteMap<K, V>(_map, _mapFactory);

  /// Deep hashCode.
  ///
  /// A `FreezedMap` is only equal to another `FreezedMap` with equal key/value
  /// pairs in any order. Then, the `hashCode` is guaranteed to be the same.
  @override
  int get hashCode {
    _hashCode ??= hashObjects(_map.keys
        .map((key) => hash2(key.hashCode, _map[key].hashCode))
        .toList(growable: false)
      ..sort());
    return _hashCode!;
  }

  /// Deep equality.
  ///
  /// A `FreezedMap` is only equal to another `FreezedMap` with equal key/value
  /// pairs in any order.
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FreezedMap) return false;
    if (other.length != length) return false;
    if (other.hashCode != hashCode) return false;
    for (var key in keys) {
      if (other[key] != this[key]) return false;
    }
    return true;
  }

  @override
  String toString() => _map.toString();

  // Map.

  // $FreezedMapCopyWith<K, V, FreezedMap<K, V>> toBuilder() =>
  //     $FreezedMapCopyWith._fromFreezedMap(this as _FreezedMap<K, V>);

  /// As [Map].
  V? operator [](Object? key) => _map[key];

  /// As [Map.containsKey].
  bool containsKey(Object key) => _map.containsKey(key);

  /// As [Map.containsValue].
  bool containsValue(Object value) => _map.containsValue(value);

  /// As [Map.forEach].
  void forEach(void Function(K, V) f) {
    _map.forEach(f);
  }

  /// As [Map.isEmpty].
  bool get isEmpty => _map.isEmpty;

  /// As [Map.isNotEmpty].
  bool get isNotEmpty => _map.isNotEmpty;

  /// As [Map.keys], but result is stable; it always returns the same instance.
  Iterable<K> get keys {
    _keys ??= _map.keys;
    return _keys!;
  }

  /// As [Map.length].
  int get length => _map.length;

  /// As [Map.values], but result is stable; it always returns the same
  /// instance.
  Iterable<V> get values {
    _values ??= _map.values;
    return _values!;
  }

  /// As [Map.entries].
  Iterable<MapEntry<K, V>> get entries => _map.entries;

  /// As [Map.map], but returns a [FreezedMap].
  FreezedMap<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K, V) f) =>
      _FreezedMap<K2, V2>.withSafeMap(null, _map.map(f));

  factory FreezedMap.fromJson(Map<String, dynamic> json) =>
      FreezedMap<K, V>.from(json);

  Map<String, dynamic> toJson() =>
      Map.fromEntries(entries.map((e) => MapEntry(e.key.toString(), e.value)));

  // Internal.

  FreezedMap._(this._mapFactory, this._map);
}

mixin _$FreezedMap<K, V> {
  late Map<K, V> _map;

  /// Create a copy of FreezedMap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FreezedMapCopyWith<K, V, FreezedMap<K, V>> get copyWith =>
      $FreezedMapCopyWith<K, V, FreezedMap<K, V>>(
          this as FreezedMap<K, V>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FreezedMap<K, V> &&
            const DeepCollectionEquality().equals(other._map, _map));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_map));

  @override
  String toString() {
    return 'FreezedMap<$K, $V>(_map: $_map)';
  }
}

/// Default implementation of the public [FreezedMap] interface.
class _FreezedMap<K, V> extends FreezedMap<K, V> {
  _FreezedMap.withSafeMap(super.mapFactory, super.map) : super._();

  _FreezedMap.copyAndCheckTypes(Iterable keys, Function lookup)
      : super._(null, <K, V>{}) {
    for (var key in keys) {
      if (key is K) {
        var value = lookup(key);
        if (value is V) {
          _map[key] = value;
        } else {
          throw ArgumentError('map contained invalid value: $value');
        }
      } else {
        throw ArgumentError('map contained invalid key: $key');
      }
    }
  }

  _FreezedMap.copyAndCheckForNull(Iterable<K> keys, V Function(K) lookup)
      : super._(null, <K, V>{}) {
    var checkKeys = !isSoundMode && null is! K;
    var checkValues = !isSoundMode && null is! V;
    for (var key in keys) {
      if (checkKeys && identical(key, null)) {
        throw ArgumentError('map contained invalid key: null');
      }
      var value = lookup(key);
      if (checkValues && value == null) {
        throw ArgumentError('map contained invalid value: null');
      }
      _map[key] = value;
    }
  }

  bool hasExactKeyAndValueTypes(Type key, Type value) => K == key && V == value;
}

// /// @nodoc
// abstract mixin class $FreezedMapCopyWith<K, V, $Res> {
//   factory $FreezedMapCopyWith(
//           FreezedMap<K, V> value /*, $Res Function(FreezedMap<K, V>) then*/) =
//       $FreezedMapCopyWith;
//
//   @useResult
//   FreezedMap<K, V> seal();
//
//   $FreezedMapCopyWith<K, V, $Res> call({Map<K, V> map});
//
//   $FreezedMapCopyWith<K, V, $Res> replace(Object? map);
//
//   $FreezedMapCopyWith<K, V, $Res> withBase(_MapFactory<K, V> base);
//
//   $FreezedMapCopyWith<K, V, $Res> withDefaultBase();
//
//   $FreezedMapCopyWith<K, V, $Res> addIterable<T>(Iterable<T> iterable,
//       {K Function(T)? key, V Function(T)? value});
//
//   operator []=(K key, V value);
//
//   $FreezedMapCopyWith<K, V, $Res> putIfAbsent(K key, V Function() ifAbsent);
//
//   $FreezedMapCopyWith<K, V, $Res> addAll(Map<K, V> other);
//
//   $FreezedMapCopyWith<K, V, $Res> remove(Object? key);
//
//   $FreezedMapCopyWith<K, V, $Res> removeWhere(bool Function(K, V) predicate);
//
//   $FreezedMapCopyWith<K, V, $Res> clear();
//
//   $FreezedMapCopyWith<K, V, $Res> addEntries(
//       Iterable<MapEntry<K, V>> newEntries);
//
//   $FreezedMapCopyWith<K, V, $Res> updateValue(K key, V Function(V) update,
//       {V Function()? ifAbsent});
//
//   $FreezedMapCopyWith<K, V, $Res> updateAllValues(V Function(K, V) update);
// }

/// @nodoc
class $FreezedMapCopyWith<K, V, $Res> {
  /// Used by [_createMap] to instantiate [_map]. The default value is `null`.
  $MapFactory<K, V>? _mapFactory;
  late Map<K, V> _map;
  _FreezedMap<K, V>? _mapOwner;

  final $Res Function(FreezedMap<K, V>) _then;

  // $FreezedMapCopyWith._fromFreezedMap(_FreezedMap<K, V> map)
  //     : _mapFactory = map._mapFactory,
  //       _map = map._map,
  //       _mapOwner = map;

  /// Instantiates with elements from a [Map] or [FreezedMap].
  factory $FreezedMapCopyWith(
      FreezedMap<K, V> value, $Res Function(FreezedMap<K, V>) then) {
    return $FreezedMapCopyWith<K, V, $Res>._uninitialized(then)..replace(value);
  }

  /// Converts to a [FreezedMap].
  ///
  /// The `$FreezedMapCopyWith` can be modified again and used to create any number
  /// of `FreezedMap`s.

  $Res seal() {
    _mapOwner ??= _FreezedMap<K, V>.withSafeMap(_mapFactory, _map);
    return _then(FreezedMap(
      _mapOwner ?? _map,
    ));
  }

  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> call({Map<K, V>? map}) {
    replace(map);
    return this;
  }

  //
  // /// Applies a function to `this`.
  // void update(Function($FreezedMapCopyWith<K, V> builder) updates) {
  //   updates(this);
  // }

  /// Replaces all elements with elements from a [Map] or [FreezedMap].
  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> replace(Object? map) {
    if (map is _FreezedMap<K, V> && map._mapFactory == _mapFactory) {
      _setOwner(map);
    } else if (map is FreezedMap) {
      var replacement = _createMap();
      map.forEach((dynamic key, dynamic value) {
        replacement[key as K] = value as V;
      });
      _setSafeMap(replacement);
    } else if (map is Map) {
      var replacement = _createMap();
      map.forEach((dynamic key, dynamic value) {
        replacement[key as K] = value as V;
      });
      _setSafeMap(replacement);
    } else {
      throw ArgumentError('expected Map or FreezedMap, got ${map.runtimeType}');
    }

    return this;
  }

  /// Uses `base` as the collection type for all maps created by this builder.
  ///
  ///     // Iterates over elements in ascending order.
  ///     new $FreezedMapCopyWith<int, String>()
  ///       ..withBase(() => new SplayTreeMap<int, String>());
  ///
  ///     // Uses custom equality.
  ///     new $FreezedMapCopyWith<int, String>()
  ///       ..withBase(() => new LinkedHashMap<int, String>(
  ///           equals: (int a, int b) => a % 255 == b % 255,
  ///           hashCode: (int n) => (n % 255).hashCode));
  ///
  /// The map returned by `base` must be empty, mutable, and each call must
  /// instantiate and return a new object.
  ///
  /// Use [withDefaultBase] to reset `base` to the default value.
  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> withBase($MapFactory<K, V> base) {
    ArgumentError.checkNotNull(base, 'base');
    _mapFactory = base;
    _setSafeMap(_createMap()..addAll(_map));
    return this;
  }

  /// As [withBase], but sets `base` back to the default value, which
  /// instantiates `Map<K, V>`.
  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> withDefaultBase() {
    _mapFactory = null;
    _setSafeMap(_createMap()..addAll(_map));
    return this;
  }

  /// As [Map.fromIterable] but adds.
  ///
  /// [key] and [value] default to the identity function.
  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> addIterable<T>(Iterable<T> iterable,
      {K Function(T)? key, V Function(T)? value}) {
    key ??= (T x) => x as K;
    value ??= (T x) => x as V;
    for (var element in iterable) {
      this[key(element)] = value(element);
    }

    return this;
  }

  // Based on Map.

  /// As [Map].
  @pragma('vm:prefer-inline')
  void operator []=(K key, V value) {
    _checkKey(key);
    _checkValue(value);
    _safeMap[key] = value;
  }

  /// As [Map.length].
  int get length => _map.length;

  /// As [Map.isEmpty].
  bool get isEmpty => _map.isEmpty;

  /// As [Map.isNotEmpty].
  bool get isNotEmpty => _map.isNotEmpty;

  /// As [Map.putIfAbsent].
  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> putIfAbsent(K key, V Function() ifAbsent) {
    _checkKey(key);
    _safeMap.putIfAbsent(key, () {
      var value = ifAbsent();
      _checkValue(value);
      return value;
    });

    return this;
  }

  /// As [Map.addAll].
  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> addAll(Map<K, V> other) {
    _checkKeys(other.keys);
    _checkValues(other.values);
    _safeMap.addAll(other);
    return this;
  }

  /// As [Map.remove].
  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> remove(Object? key) {
    _safeMap.remove(key);
    return this;
  }

  /// As [Map.removeWhere].
  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> removeWhere(bool Function(K, V) predicate) {
    _safeMap.removeWhere(predicate);
    return this;
  }

  /// As [Map.clear].
  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> clear() {
    _safeMap.clear();
    return this;
  }

  /// As [Map.addEntries].
  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> addEntries(
      Iterable<MapEntry<K, V>> newEntries) {
    _safeMap.addEntries(newEntries);
    return this;
  }

  /// As [Map.update].
  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> updateValue(K key, V Function(V) update,
      {V Function()? ifAbsent}) {
    _safeMap.update(key, update, ifAbsent: ifAbsent);
    return this;
  }

  /// As [Map.updateAll].
  @pragma('vm:prefer-inline')
  @override
  $FreezedMapCopyWith<K, V, $Res> updateAllValues(V Function(K, V) update) {
    _safeMap.updateAll(update);
    return this;
  }

  // Internal.

  $FreezedMapCopyWith._uninitialized(this._then);

  void _setOwner(_FreezedMap<K, V> mapOwner) {
    assert(mapOwner._mapFactory == _mapFactory,
        "Can't reuse a built map that uses a different base");
    _mapOwner = mapOwner;
    _map = mapOwner._map;
  }

  void _setSafeMap(Map<K, V> map) {
    _mapOwner = null;
    _map = map;
  }

  Map<K, V> get _safeMap {
    if (_mapOwner != null) {
      _map = _createMap()..addAll(_map);
      _mapOwner = null;
    }
    return _map;
  }

  Map<K, V> _createMap() => _mapFactory != null ? _mapFactory!() : <K, V>{};

  void _checkKey(K key) {
    if (isSoundMode) return;
    if (null is K) return;
    if (identical(key, null)) {
      throw ArgumentError('null key');
    }
  }

  void _checkKeys(Iterable<K> keys) {
    if (isSoundMode) return;
    if (null is K) return;
    for (var key in keys) {
      _checkKey(key);
    }
  }

  void _checkValue(V value) {
    if (isSoundMode) return;
    if (null is V) return;
    if (identical(value, null)) {
      throw ArgumentError('null value');
    }
  }

  void _checkValues(Iterable<V> values) {
    if (isSoundMode) return;
    if (null is V) return;
    for (var value in values) {
      _checkValue(value);
    }
  }
/////////////////////////////////////////////
}

/// Extensions for [FreezedMap] on [Map].
extension FreezedMapExtension<K, V> on Map<K, V> {
  /// Converts to a [FreezedMap].
  FreezedMap<K, V> build() => FreezedMap<K, V>.of(this);
}

T _$identity<T>(T value) => value;
