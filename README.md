# Freezed Collection

Extending dart `Freezed` collection with deep `copyWith`.

## Install

```yaml
dependencies:
  freezed_collection: ^2.1.3-pre1
```

## Status

- [x] `FreezedList<T>`
- [x] `FreezedMap<T>`
- [x] `FreezedSet<T>`

## copyWith

[//]: # ( @formatter:off)

Given:

```dart
@freezed
abstract class One with _$One {
  const factory One(String name, Two two) = _One;
}

@freezed
abstract class Two with _$Two {
  const factory Two(int index, FreezedMap<String, int> three) = _Two;
}

final one = One('a', Two(1, FreezedMap({'1': 2, '3': 4})));
```
then you can use `copyWith` chain:
```dart
final two = one.copyWith.two.three.withBase(() =>
    SplayTreeMap()).remove('1').addAll({'5': 6, '7': 8}).seal();
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

## Json

If `FreezedMap<K,V>` has non-standard (non-string) key, it will be encoded using `json.encode` and decoded using
`json.decode`. This leads to some performance leakage. So use `String` for keys if you plan to serialize.
