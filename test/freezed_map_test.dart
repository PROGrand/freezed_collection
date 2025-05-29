import 'dart:collection' show SplayTreeMap;
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_collection/src/freezed_map.dart';
import 'package:test/test.dart';

part 'freezed_map_test.freezed.dart';
part 'freezed_map_test.g.dart';

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

void main() {
  group('FreezedMap Demo', () {
    test('FreezedMap Demo', () {
      final one = One('a', Two(1, FreezedMap({'1': 2, '3': 4})));
      final two = one.copyWith.two.three(map: {'5': 6, '7': 8}).seal();

      print(jsonEncode(two.toJson()));
    });
  });

  group('FreezedMap Tests', () {
    test('has call', () {
      final map = FreezedMap({'1': 1});
      final map2 = map.copyWith(map: {'2': 2, '3': 3}).seal();

      expect(map2.entries.map((e) => e.value).toSet(), equals({2, 3}));
    });

    test('has replace', () {
      final map = FreezedMap({'1': 1});
      final map2 = map.copyWith.replace({'2': 2}).seal();

      expect(map.entries.map((e) => e.key).toSet(), equals({'1'}));
      expect(map.entries.map((e) => e.value).toSet(), equals({1}));
      expect(map2.entries.map((e) => e.key).toSet(), equals({'2'}));
      expect(map2.entries.map((e) => e.value).toSet(), equals({2}));
    });

    test('has withBase', () {
      final map = FreezedMap({'2': 1, '1': 1, '3': 1, '0': 1});
      final map2 = map.copyWith.withBase(() => SplayTreeMap()).seal();

      expect(map2.entries.map((e) => e.key).toList(),
          equals(['0', '1', '2', '3']));
    });

    test('has withDefaultBase', () {
      final map = FreezedMap({'2': 1, '1': 1, '3': 1, '0': 1});
      final map2 = map.copyWith.withDefaultBase().seal();

      expect(map2.entries.map((e) => e.key).toList(),
          equals(['2', '1', '3', '0']));
    });

    test('has withBase', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 = map.copyWith
          .addIterable([4, 5, 6], key: (p0) => '$p0', value: (p0) => p0).seal();

      expect(map.entries.map((e) => e.key).toSet(), equals({'1', '2', '3'}));

      expect(map.entries.map((e) => e.value).toSet(), equals({1, 2, 3}));

      expect(map2.entries.map((e) => e.key).toSet(),
          equals({'1', '2', '3', '4', '5', '6'}));

      expect(
          map2.entries.map((e) => e.value).toSet(), equals({1, 2, 3, 4, 5, 6}));
    });
  });
}
