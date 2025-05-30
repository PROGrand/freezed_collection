# Freezed Collection

Extending dart `Freezed` collection with deep `copyWith`.

## Install

```yaml
dependencies:
  freezed_collection: ^2.1.2-pre1
```

## Status

[FreezedMap](lib/src/freezed_map.dart) and [FreezedList](lib/src/freezed_list.dart) can be used.

`FreezedSet` is coming soon.

## copyWith

[//]: # ( @formatter:off)
```dart
@freezed
abstract class One with _$One {
  const factory One(String name, Two two) = _One;

  factory One.fromJson(Map<String, dynamic> json) => _$OneFromJson(json);
}

@freezed
abstract class Two with _$Two {
  const factory Two(int index, FreezedMap<String, int> three) = _Two;

  factory Two.fromJson(Map<String, dynamic> json) => _$TwoFromJson(json);
}

final one = One('a', Two(1, FreezedMap({'1': 2, '3': 4})));
final two = one.copyWith.two.three.addAll({'5': 6, '7': 8}).seal();

final json = jsonEncode(two.toJson());
final dec = One.fromJson(jsonDecode(json));
expect(dec.two.three.toMap(), equals({'1': 2, '3': 4, '5': 6, '7': 8}));
final dec2 = One.fromJson(jsonDecode(
  '{"name":"a","two":{"index":1,"three":{"1":2,"3":4,"5":6,"7":8}}}'));
expect(dec2.two.three.toMap(), equals({'1': 2, '3': 4, '5': 6, '7': 8}));
```
[//]: # ( @formatter:on)

## Sealing

`copyWith` returns mutable builder with methods mapped to corresponding collection interface.

`seal()` method should be used to build freezed collection.

## Chaining

[//]: # ( @formatter:off)
```dart
final map = FreezedMap({'1': 1});
final map2 = map.copyWith(map: {'2': 2, '3': 3}).updateAllValues((k, p0) => p0 + 1).removeWhere((k, v) => 2 == v).seal();
```
[//]: # ( @formatter:on)

- [x] `FreezedList<T>.fromJson`
- [x] `FreezedList<T>.copyWith.replaceFirst(T newElement, bool Function(T element) what)`

## Json

If `FreezedMap<K,V>` has non-standard (non-string) key, it will be encoded using `json.encode` and decoded using
`json.decode`. This leads to some performance leakage. So use `String` for keys if you plan to serialize.
