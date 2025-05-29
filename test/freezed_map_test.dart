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
      final two = one.copyWith.two.three.addAll({'5': 6, '7': 8}).seal();

      final json = jsonEncode(two.toJson());
      final dec = One.fromJson(jsonDecode(json));
      expect(dec.two.three.toMap(), equals({'1': 2, '3': 4, '5': 6, '7': 8}));
      final dec2 = One.fromJson(jsonDecode(
          '{"name":"a","two":{"index":1,"three":{"1":2,"3":4,"5":6,"7":8}}}'));
      expect(dec2.two.three.toMap(), equals({'1': 2, '3': 4, '5': 6, '7': 8}));
    });
  });

  group('FreezedMap Tests', () {
    test('has call', () {
      final map = FreezedMap({'1': 1});
      final map2 = map.copyWith(map: {'2': 2, '3': 3}).seal();

      expect(map.toMap(), equals({'1': 1}));
      expect(map2.toMap(), equals({'2': 2, '3': 3}));
    });

    test('has replace', () {
      final map = FreezedMap({'1': 1, '3': 3});
      final map2 = map.copyWith.replace({'2': 2}).seal();

      expect(map.toMap(), equals({'1': 1, '3': 3}));
      expect(map2.toMap(), equals({'2': 2}));
    });

    test('has withBase', () {
      final map = FreezedMap({'2': 1, '1': 1, '3': 1, '0': 1});
      final map2 = map.copyWith.withBase(() => SplayTreeMap()).seal();

      expect(map.toMap(), equals({'2': 1, '1': 1, '3': 1, '0': 1}));
      expect(map2.entries.map((e) => e.key).toList(),
          equals(['0', '1', '2', '3']));
    });

    test('has withDefaultBase', () {
      final map = FreezedMap({'2': 1, '1': 1, '3': 1, '0': 1});
      final map2 = map.copyWith.withDefaultBase().seal();

      expect(map.toMap(), equals({'2': 1, '1': 1, '3': 1, '0': 1}));
      expect(map2.entries.map((e) => e.key).toList(),
          equals(['2', '1', '3', '0']));
    });

    test('has addIterable', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 = map.copyWith
          .addIterable([4, 5, 6], key: (p0) => '$p0', value: (p0) => p0).seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(),
          equals({'1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6}));
    });

    test('has putIfAbsent', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 = map.copyWith
          .putIfAbsent('3', () => 3)
          .putIfAbsent('4', () => 4)
          .seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(), equals({'1': 1, '2': 2, '3': 3, '4': 4}));
    });

    test('has addAll', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 = map.copyWith.addAll({'4': 4, '5': 5, '6': 6}).seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(),
          equals({'1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6}));
    });

    test('has remove', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 = map.copyWith.remove('1').seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(), equals({'2': 2, '3': 3}));
    });

    test('has removeWhere', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 = map.copyWith
          .removeWhere((k, v) => k == '1')
          .removeWhere((k, v) => 2 == v)
          .seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(), equals({'3': 3}));
    });

    test('has clear', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 = map.copyWith.clear().seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(), isEmpty);
    });

    test('has addEntries', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 =
          map.copyWith.addEntries([MapEntry('4', 4), MapEntry('5', 5)]).seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(), equals({'1': 1, '2': 2, '3': 3, '4': 4, '5': 5}));
    });

    test('has updateValue', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 = map.copyWith
          .updateValue('1', (p0) => p0 + 1)
          .updateValue(
            '0',
            (p0) => p0++,
            ifAbsent: () => -1,
          )
          .seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(), equals({'0': -1, '1': 2, '2': 2, '3': 3}));
    });

    test('has updateAllValues', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 = map.copyWith.updateAllValues((k, p0) => p0 + 1).seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(), equals({'1': 2, '2': 3, '3': 4}));
    });
  });
}
