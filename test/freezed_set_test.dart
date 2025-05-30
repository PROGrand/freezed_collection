/*
 * Copyright (c) 2025. Vladimir E. Koltunov, mtbo.org
 * Please see the AUTHORS file for details.
 * All rights reserved. Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

//dart pub global activate coverage
//dart pub global run coverage:test_with_coverage
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_collection/freezed_collection.dart';
import 'package:test/test.dart';

part 'freezed_set_test.freezed.dart';
part 'freezed_set_test.g.dart';

@freezed
abstract class One with _$One {
  const factory One(String name, Two two) = _One;

  factory One.fromJson(Map<String, dynamic> json) => _$OneFromJson(json);
}

@freezed
abstract class Two with _$Two {
  const factory Two(String name, FreezedSet<Three> threes) = _Two;

  factory Two.fromJson(Map<String, dynamic> json) => _$TwoFromJson(json);
}

@freezed
abstract class Three with _$Three {
  const factory Three(String name) = _Three;

  factory Three.fromJson(Map<String, dynamic> json) => _$ThreeFromJson(json);
}

@freezed
abstract class Collector with _$Collector {
  const factory Collector(FreezedSet<Numbers> numbers) = _Collector;

  factory Collector.fromJson(Map<String, dynamic> json) =>
      _$CollectorFromJson(json);
}

@freezed
abstract class Numbers with _$Numbers {
  const factory Numbers(FreezedSet<int> values) = _Numbers;

  factory Numbers.fromJson(Map<String, dynamic> json) =>
      _$NumbersFromJson(json);
}

void main() {
  group('Demo tests', () {
    test('FreezedSet has deep  copyWith', () {
      final one = One(
          '1', Two('2', FreezedSet([Three('31'), Three('32'), Three('31')])));

      final abc =
          one.copyWith.two.threes([Three('a'), Three('b'), Three('c')]).seal();

      expect(abc.two.threes.map((p0) => p0.name), equals(['a', 'b', 'c']));
    });
  });

  group('FreezedSet', () {
    test('has call', () {
      final list = FreezedSet({1, 2});
      final list2 = list.copyWith({4, 5}).seal();

      expect(list, equals({1, 2}));
      expect(list2, equals({4, 5}));
    });

    test('has call with null', () {
      final list = FreezedSet({1, 2});
      final list2 = list.copyWith({}).seal();

      expect(list, equals({1, 2}));
      expect(list2, equals(<int>{}));
    });

    test('has add', () {
      final list = FreezedSet({1, 2});
      final list2 = list.copyWith..add(3);

      expect(list, equals({1, 2}));
      expect(list2.seal(), equals({1, 2, 3}));
    });

    test('has addAll', () {
      final list = FreezedSet({1, 2, 3});
      final list2 = list.copyWith.addAll({4, 5}).seal();

      expect(list, equals({1, 2, 3}));
      expect(list2, equals([1, 2, 3, 4, 5]));
    });

    test('has clear', () {
      final list = FreezedSet({1, 2, 3});
      final list2 = list.copyWith.clear().seal();

      expect(list, equals({1, 2, 3}));
      expect(list2, equals([]));
    });

    test('has remove', () {
      final list = FreezedSet({1, 2, 3});
      final list2 = (list.copyWith..remove(2)).seal();

      expect(list, equals({1, 2, 3}));
      expect(list2, equals({1, 3}));
    });

    test('has removeWhere', () {
      final list = FreezedSet({1, 2});
      final list2 = list.copyWith.removeWhere((element) => element == 1).seal();

      expect(list, equals({1, 2}));
      expect(list2, equals({2}));
    });

    test('has retainWhere', () {
      final list = FreezedSet({1, 2});
      final list2 = list.copyWith.retainWhere((element) => element == 2).seal();

      expect(list, equals({1, 2}));
      expect(list2, equals({2}));
    });
  });
}
