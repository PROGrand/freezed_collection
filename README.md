Extending dart freezed with deep collection copyWith.

## Features

- [x] `FreezedList<T>.fromJson`
- [x] `FreezedList<T>.copyWith.replaceFirst(T newElement, bool Function(T element) what)`

## Example

[//]: # ( @formatter:off)
```dart
@freezed
class One with _$One {
  const factory One(String name, Two two) = _One;

  factory One.fromJson(Map<String, dynamic> json) => _$OneFromJson(json);
}

@freezed
class Two with _$Two {
  const factory Two(String name, FreezedList<Three> threes) = _Two;

  factory Two.fromJson(Map<String, dynamic> json) => _$TwoFromJson(json);
}

@freezed
class Three with _$Three {
  const factory Three(String name) = _Three;

  factory Three.fromJson(Map<String, dynamic> json) => _$ThreeFromJson(json);
}

test('FreezedList have replaceFirstWhere', () {
  final list = FreezedList(['1', '2', '3']);
  final list2 = list.copyWith.replaceFirstWhere(
    'newElement',
    (element) => element == '1',
  );

  expect(list2, equals(['newElement', '2', '3']));
});

test('FreezedList has deep copyWith', () {
  final one = One(
      '1', Two('2', FreezedList([Three('31'), Three('32'), Three('31')])));

  final abc =
      one.copyWith.two.threes(list: [Three('a'), Three('b'), Three('c')]);

  expect(abc.two.threes.map((p0) => p0.name), equals(['a', 'b', 'c']));
});
```
[//]: # ( @formatter:on)