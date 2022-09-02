Extending dart freezed with deep collection copyWith.

## Features

- [x] `FreezedList<T>.fromJson`
- [x] `FreezedList<T>.copyWith.replaceFirst(T newElement, bool Function(T element) what)`
 
## Example

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

void test() {
  final var1 = One('1', Two('2', FreezedList([Three('31'), Three('32'), Three('33')])));
  final var2 = One('1', Two('2', FreezedList([Three('31'), Three('32'), Three('33')])));
  final var21 = var2.copyWith();
  expect(var1, equals(var2));
  expect(var1, equals(var21));
  final var3 = var21.copyWith
      .two(name: '21')
      .copyWith
      .two
      .threes
      .replaceFirst(Three('XXX'), (element) => element.name == '31');
  expect(var3, isNot(var21));
  final var4 = var3.copyWith
      .two(name: '2')
      .copyWith
      .two
      .threes
      .replaceFirst(Three('31'), (element) => element.name == 'XXX');
  expect(var4, equals(var21));
}
```
