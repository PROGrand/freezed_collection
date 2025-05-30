/*
 * Copyright (c) 2025. Vladimir E. Koltunov, mtbo.org
 * Please see the AUTHORS file for details.
 * All rights reserved. Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

import 'dart:collection' show SplayTreeMap;
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_collection/src/freezed_map.dart';
import 'package:freezed_collection/src/internal/null_safety.dart' show isSoundMode;
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

@freezed
abstract class IntMap with _$IntMap {
  const factory IntMap(int index, FreezedMap<int, int> map) = _IntMap;

  factory IntMap.fromJson(Map<String, dynamic> json) => _$IntMapFromJson(json);
}

void main() async {
  group('FreezedMap Demo', () {
    test('FreezedMap Demo', () {
      final one = One('a', Two(1, FreezedMap({'1': 2, '3': 4})));
      final two = one.copyWith.two.three.addAll({'5': 6, '7': 8}).seal();

      final json = jsonEncode(two.toJson());
      final dec = One.fromJson(jsonDecode(json));
      expect(dec.two.three.toMap(), equals({'1': 2, '3': 4, '5': 6, '7': 8}));
      final dec2 = One.fromJson(
          jsonDecode('{"name":"a","two":{"index":1,"three":{"1":2,"3":4,"5":6,"7":8}}}'));
      expect(dec2.two.three.toMap(), equals({'1': 2, '3': 4, '5': 6, '7': 8}));
    });
  });

  group('FreezedMap Map Interface', () {
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
      expect(map2.entries.map((e) => e.key).toList(), equals(['0', '1', '2', '3']));
    });

    test('has withDefaultBase', () {
      final map = FreezedMap({'2': 1, '1': 1, '3': 1, '0': 1});
      final map2 = map.copyWith.withDefaultBase().seal();

      expect(map.toMap(), equals({'2': 1, '1': 1, '3': 1, '0': 1}));
      expect(map2.entries.map((e) => e.key).toList(), equals(['2', '1', '3', '0']));
    });

    test('has addIterable', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 =
          map.copyWith.addIterable([4, 5, 6], key: (p0) => '$p0', value: (p0) => p0).seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(), equals({'1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6}));
    });

    test('has putIfAbsent', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 = map.copyWith.putIfAbsent('3', () => 3).putIfAbsent('4', () => 4).seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(), equals({'1': 1, '2': 2, '3': 3, '4': 4}));
    });

    test('has addAll', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 = map.copyWith.addAll({'4': 4, '5': 5, '6': 6}).seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(), equals({'1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6}));
    });

    test('has remove', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 = map.copyWith.remove('1').seal();

      expect(map.toMap(), equals({'1': 1, '2': 2, '3': 3}));
      expect(map2.toMap(), equals({'2': 2, '3': 3}));
    });

    test('has removeWhere', () {
      final map = FreezedMap({'1': 1, '2': 2, '3': 3});
      final map2 =
          map.copyWith.removeWhere((k, v) => k == '1').removeWhere((k, v) => 2 == v).seal();

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
      final map2 = map.copyWith.addEntries([MapEntry('4', 4), MapEntry('5', 5)]).seal();

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

  group('FreezedMap', () {
    test('constructor should throw on wrong arg', () async {
      expect(() => FreezedMap(1), throwsArgumentError);
    });

    test('of factory', () async {
      expect(FreezedMap.of({1: 1}), isA<FreezedMap<int, int>>());
    });

    test('asMap', () async {
      expect(FreezedMap.of({1: 1}).asMap(), isA<Map<int, int>>());
    });

    test('hasCode', () async {
      expect(FreezedMap.of({1: 1, 2: 2}).hashCode, equals(FreezedMap.of({2: 2, 1: 1}).hashCode));
      expect(FreezedMap.of({1: 1, 2: 2}).hashCode,
          isNot(equals((FreezedMap.of({2: 2, 1: 2}).hashCode))));
    });

    test('==', () async {
      expect(FreezedMap.of({1: 1, 2: 2}) == FreezedMap.of({2: 2, 1: 1}), isTrue);
      expect(FreezedMap.of({1: 1, 2: 2}) == FreezedMap.of({2: 2, 1: 2}), isFalse);
      expect(FreezedMap.of({1: 1, 2: 2}), isNot(equals(1)));
      expect(FreezedMap.of({1: 1, 2: 2}), isNot(equals(null)));
      final v = FreezedMap.of({1: 1, 2: 2});
      expect(v == v, isTrue);
    });

    test('toString', () async {
      expect(FreezedMap.of({1: 1, 2: 2}).toString(), isA<String>());
      expect(FreezedMap.of({1: 1, 2: 2}).toString(), isNotEmpty);
    });

    test('containsKey', () async {
      expect(FreezedMap.of({1: 1, 2: 2}).containsKey(1), isTrue);
      expect(FreezedMap.of({1: 1, 2: 2}).containsKey(3), isFalse);
    });

    test('containsValue', () async {
      expect(FreezedMap.of({1: 1, 2: 2}).containsValue(1), isTrue);
      expect(FreezedMap.of({1: 1, 2: 2}).containsValue(3), isFalse);
    });

    test('forEach', () async {
      var s = 0;
      FreezedMap.of({1: 1, 2: 2}).forEach((p0, p1) => s += p0 * 10 + p1);
      expect(s, equals(33));
    });

    test('isEmpty', () async {
      expect(FreezedMap.of({1: 1, 2: 2}).isEmpty, isFalse);
      expect(FreezedMap.of({}).isEmpty, isTrue);
      expect(FreezedMap.of({1: 1, 2: 2}).isNotEmpty, isTrue);
      expect(FreezedMap.of({}).isNotEmpty, isFalse);
    });

    test('values', () async {
      expect(FreezedMap.of({1: 1, 2: 2}).values.toSet(), equals({1, 2}));
    });

    test('map', () async {
      expect(FreezedMap.of({1: 1, 2: 2}).map((p0, p1) => MapEntry(p0 + 10, p1 + 2)),
          equals(FreezedMap.of({11: 3, 12: 4})));
    });

    test('toJson', () async {
      expect(FreezedMap.of({1: 1, 2: 2}).toJson(), equals({'1': 1, '2': 2}));
    });

    test('copyAndCheckTypes', () async {
      final two = IntMap(1, FreezedMap.of({1: 1, 2: 2}));

      expect(IntMap.fromJson(json.decode(json.encode(two))),
          isA<IntMap>().having((p0) => p0.map, 'map', equals(FreezedMap.of({1: 1, 2: 2}))));

      var json2 = {
        {'1'}: 1,
        '2': 2
      } as dynamic;

      expect(() => FreezedMap<int, int>(json2), throwsArgumentError);

      var json3 = {1: 1, 2: '2'} as dynamic;

      expect(() => FreezedMap<int, int>(json3), throwsArgumentError);
    });

    test('sound mode', () {
      expect(isSoundMode, isTrue);
    });

    test('replace', () {
      expect(
          FreezedMap.of({1: 1, 2: 2})
              .copyWith
              .replace(FreezedMap.of({3: 3, 4: 4}).copyWith.withBase(() => SplayTreeMap()).seal())
              .seal()
              .toMap(),
          equals({3: 3, 4: 4}));

      expect(() => FreezedMap.of({1: 1, 2: 2}).copyWith.replace(1), throwsArgumentError);
    });

    test('addIterable', () {
      expect(FreezedMap.of({1: 1, 2: 2}).copyWith.addIterable([3, 4]).seal().toMap(),
          equals({1: 1, 2: 2, 3: 3, 4: 4}));
    });

    test('copyWith.length', () {
      expect(FreezedMap.of({1: 1, 2: 2}).copyWith.length, equals(2));
      expect(FreezedMap.of({}).copyWith.length, equals(0));
    });

    test('copyWith.isEmpty', () {
      expect(FreezedMap.of({1: 1, 2: 2}).copyWith.isEmpty, isFalse);
      expect(FreezedMap.of({}).copyWith.isEmpty, isTrue);
    });

    test('copyWith.isNotEmpty', () {
      expect(FreezedMap.of({1: 1, 2: 2}).copyWith.isNotEmpty, isTrue);
      expect(FreezedMap.of({}).copyWith.isNotEmpty, isFalse);
    });

    test('seal', () {
      expect(
          {1: 1, 2: 2}.seal(),
          isA<FreezedMap<int, int>>()
              .having((p0) => p0.toMap(), 'freezed map', equals({1: 1, 2: 2})));
    });
  });
}
