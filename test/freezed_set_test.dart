/*
 * Copyright (c) 2025. Vladimir E. Koltunov, mtbo.org
 * Please see the AUTHORS file for details.
 * All rights reserved. Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

//dart pub global activate coverage
//dart pub global run coverage:test_with_coverage

// dart pub global run coverage:test_with_coverage && cd coverage/ && genhtml lcov.info && cd ..
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

    test('has of', () {
      final list = FreezedSet.of({1, 2});
      expect(list, equals({1, 2}));
    });

    test('has hashCode', () {
      expect(FreezedSet.of({1, 2}).hashCode,
          isNot(equals(FreezedSet.of({1, 3}).hashCode)));
    });

    test('has ==', () {
      expect(FreezedSet.of({1, 2}), equals(FreezedSet.of({1, 2})));
      expect(FreezedSet.of({1, 2}), isNot(equals(FreezedSet.of({1, 3}))));
    });

    test('has toString', () {
      expect(FreezedSet.of({1, 2}).toString(), isNotEmpty);
    });

    test('has asSet', () {
      expect(FreezedSet.of({1, 2}).asSet(),
          isA<Set>().having((p0) => p0, 'elements', equals({1, 2})));
    });

    test('has difference', () {
      expect(FreezedSet.of({1, 2}).difference(FreezedSet.of({1, 3})),
          equals(FreezedSet.of({2})));
    });

    test('has intersection', () {
      expect(FreezedSet.of({1, 2}).intersection(FreezedSet.of({1, 3})),
          equals(FreezedSet.of({1})));
    });

    test('has lookup', () {
      expect(FreezedSet.of({1, 2}).lookup(1), equals(1));
      expect(FreezedSet.of({1, 2}).lookup(3), isNull);
    });

    test('has union', () {
      expect(FreezedSet.of({1, 2}).union(FreezedSet.of({1, 3})),
          equals(FreezedSet.of({1, 2, 3})));
    });

    test('has cast', () {
      expect(FreezedSet.of({1, 2}).cast<int>(), equals({1, 2}));
    });

    test('has followedBy', () {
      expect(FreezedSet.of({1, 2}).followedBy([3, 4]), equals({1, 2, 3, 4}));
    });

    test('has whereType', () {
      expect(FreezedSet.of({1, 2, '3'}).whereType<int>(), equals({1, 2}));
      expect(FreezedSet.of({1, 2, '3'}).whereType<String>(), equals({'3'}));
    });

    test('has where', () {
      expect(
          FreezedSet.of({1, 2, 3}).where((p0) => p0 % 2 == 1), equals({1, 3}));
    });

    test('has expand', () {
      expect(
          FreezedSet.of({1, 2, 3}).expand(
            (p0) => [p0 + 10, p0 + 20],
          ),
          equals({11, 21, 12, 22, 13, 23}));
    });

    test('has contains', () {
      expect(FreezedSet.of({1, 2, 3}).contains(1), isTrue);
      expect(FreezedSet.of({1, 2, 3}).contains(4), isFalse);
      expect(FreezedSet.of({1, 2, 3}).contains('1'), isFalse);
    });

    test('has forEach', () {
      var cnt = 0;
      for (final n in FreezedSet.of({1, 2, 3})) {
        cnt += n;
      }
      expect(cnt, equals(6));
    });

    test('has reduce', () {
      expect(FreezedSet.of({1, 2, 3}).reduce((p0, p1) => p0 * p1), equals(6));
    });
  });
}
