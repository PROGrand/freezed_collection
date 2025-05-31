/*
 * Copyright (c) 2025. Vladimir E. Koltunov, mtbo.org
 * Please see the AUTHORS file for details.
 * All rights reserved. Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

//dart pub global activate coverage
//dart pub global run coverage:test_with_coverage

// dart pub global run coverage:test_with_coverage && cd coverage/ && genhtml lcov.info && cd ..
import 'dart:collection';
import 'dart:convert' show json;

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

      final list3 = FreezedSet({7, 8});
      expect(
          list2.copyWith.addAll(list3).seal(), equals({1, 2, 3, 4, 5, 7, 8}));
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

    test('has for-loop', () {
      var cnt = 0;
      for (final n in FreezedSet.of({1, 2, 3})) {
        cnt += n;
      }
      expect(cnt, equals(6));
    });

    test('has forEach', () {
      var cnt = 0;
      // ignore: avoid_function_literals_in_foreach_calls
      FreezedSet.of({1, 2, 3}).forEach((p0) => cnt += p0);

      expect(cnt, equals(6));
    });

    test('has reduce', () {
      expect(FreezedSet.of({1, 2, 3}).reduce((p0, p1) => p0 * p1), equals(6));
    });

    test('has fold', () {
      expect(
          FreezedSet.of({1, 2, 3}).fold(10, (p0, p1) => p0 * p1), equals(60));
    });

    test('has every', () {
      expect(FreezedSet.of({1, 2, 3}).every((p0) => p0 < 0), isFalse);
      expect(FreezedSet.of({1, 2, 3}).every((p0) => p0 > 0), isTrue);
    });

    test('has join', () {
      expect(FreezedSet.of({1, 2, 3}).join(' '), equals('1 2 3'));
    });

    test('has any', () {
      expect(FreezedSet.of({1, 2, '3'}).any((p0) => p0 is String), isTrue);
      expect(FreezedSet.of({1, 2, 3}).any((p0) => p0 < 0), isFalse);
    });

    test('has update', () {
      final s = Set.of({0});
      FreezedSet.of({1, 2, 3}).copyWith.update((p0) => s.addAll(p0.seal()));

      expect(s, equals({0, 1, 2, 3}));
    });

    test('has toList', () {
      expect(FreezedSet.of({1, 2, 3}).toList(),
          isA<List>().having((p0) => p0, 'elements', [1, 2, 3]));
    });

    test('has isEmpty', () {
      expect(FreezedSet.of({1, 2, 3}).isEmpty, isFalse);
      expect(FreezedSet.of({}).isEmpty, isTrue);
      expect(FreezedSet.of({1, 2, 3}).isNotEmpty, isTrue);
      expect(FreezedSet.of({}).isNotEmpty, isFalse);
    });

    test('has take', () {
      expect(FreezedSet.of({1, 2, 3, 4, 5}).take(2), equals({1, 2}));
    });

    test('has takeWhile', () {
      expect(FreezedSet.of({1, 2, 3, 4, 5}).takeWhile((p0) => p0 != 3),
          equals({1, 2}));
    });

    test('has skip', () {
      expect(FreezedSet.of({1, 2, 3, 4, 5}).skip(2), equals({3, 4, 5}));
    });

    test('has skipWhile', () {
      expect(FreezedSet.of({1, 2, 3, 4, 5}).skipWhile((p0) => p0 != 3),
          equals({3, 4, 5}));
    });

    test('has first', () {
      expect(FreezedSet.of({1, 2, 3, 4, 5}).first, equals(1));
    });

    test('has last', () {
      expect(FreezedSet.of({1, 2, 3, 4, 5}).last, equals(5));
    });

    test('has single', () {
      expect(FreezedSet.of({1}).single, equals(1));
      expect(() => FreezedSet.of({1, 2}).single, throwsStateError);
      expect(() => FreezedSet.of({}).single, throwsStateError);
    });

    test('has firstWhere', () {
      expect(FreezedSet.of({1, 2, 3}).firstWhere((p0) => p0 == 2), equals(2));
      expect(() => FreezedSet.of({1, 2}).firstWhere((p0) => p0 == 100),
          throwsStateError);
    });

    test('has lastWhere', () {
      expect(
          FreezedSet.of({1, 2, 3}).lastWhere((p0) => p0 % 2 == 1), equals(3));
      expect(() => FreezedSet.of({1, 2}).lastWhere((p0) => p0 == 100),
          throwsStateError);
    });

    test('has singleWhere', () {
      expect(FreezedSet.of({1, 2, 3}).singleWhere((p0) => p0 == 2), equals(2));
      expect(() => FreezedSet.of({1, 2}).singleWhere((p0) => p0 == 100),
          throwsStateError);
    });

    test('has elementAt', () {
      expect(FreezedSet.of({1, 2, 3}).elementAt(1), equals(2));
      expect(() => FreezedSet.of({1, 2}).elementAt(100), throwsRangeError);
    });

    test('has fromJson', () {
      expect(FreezedSet.fromJson(json.decode('[1, 2, 3]'), (p0) => p0),
          equals({1, 2, 3}));
    });

    test('has toJson', () {
      final s = json.encode(FreezedSet.of({1, 2, 3}).toJson());

      expect(
          FreezedSet.fromJson(json.decode(s), (p0) => p0), equals({1, 2, 3}));
    });

    test('has withBase', () {
      final orig = FreezedSet.of({1, 3, 2, 4, 0});
      final splay = orig.copyWith.withBase(() => SplayTreeSet()).seal();

      expect(splay.toList(), equals([0, 1, 2, 3, 4]));
    });

    test('has withDefaultBase', () {
      final orig = FreezedSet.of({1, 3, 2, 4, 0});
      final splay = orig.copyWith.withBase(() => SplayTreeSet()).seal();
      final def = splay.copyWith.withDefaultBase()..add(-1);

      var $freezedSetCopyWith = splay.copyWith..add(-1);
      final seal = ($freezedSetCopyWith).seal();

      expect(seal.toList(), equals([-1, 0, 1, 2, 3, 4]));
      expect(def.seal().toList(), equals([0, 1, 2, 3, 4, -1]));
    });

    test('has copyWith replace', () {
      final freezedSet = FreezedSet.of({1, 2, 3});

      expect(
          () => freezedSet.copyWith.replace(['1']).seal(), throwsArgumentError);
    });

    test('has type error', () {
      expect(() => FreezedSet<int>(['1']), throwsA(TypeMatcher<TypeError>()));
    });

    test('has copyWith length', () {
      expect(FreezedSet.of({1, 2, 3}).copyWith.length, equals(3));
    });

    test('has copyWith isEmpty', () {
      expect(FreezedSet.of({1, 2, 3}).copyWith.isEmpty, isFalse);
      expect(FreezedSet.of({}).copyWith.isEmpty, isTrue);
    });

    test('has copyWith isNotEmpty', () {
      expect(FreezedSet.of({1, 2, 3}).copyWith.isNotEmpty, isTrue);
      expect(FreezedSet.of({}).copyWith.isNotEmpty, isFalse);
    });

    test('has copyWith removeAll', () {
      expect(FreezedSet.of({1, 2, 3}).copyWith.removeAll({1}).seal(),
          equals({2, 3}));
    });

    test('has copyWith retainAll', () {
      expect(
          FreezedSet.of({1, 2, 3}).copyWith.retainAll({1}).seal(), equals({1}));
    });

    test('has copyWith addAll', () {
      expect(FreezedSet.of({1, 2, 3}).copyWith.addAll({4, 5}).seal(),
          equals({1, 2, 3, 4, 5}));
    });

    test('has copyWith where', () {
      expect(FreezedSet.of({1, 2, 3}).copyWith.where((p0) => p0 < 3).seal(),
          equals({1, 2}));
    });

    test('has copyWith map', () {
      expect(FreezedSet.of({1, 2, 3}).copyWith.map((p0) => p0 + 1).seal(),
          equals({2, 3, 4}));
    });

    test('has copyWith expand', () {
      expect(
          FreezedSet.of({1, 2, 3})
              .copyWith
              .expand((p0) => {p0 * 10, p0 * 20})
              .seal(),
          equals({10, 20, 30, 40, 60}));
    });

    test('has copyWith take', () {
      expect(FreezedSet.of({1, 2, 3}).copyWith.take(2).seal(), equals({1, 2}));
    });

    test('has copyWith takeWhile', () {
      expect(
          FreezedSet.of({1, 2, 3}).copyWith.takeWhile((p0) => p0 <= 2).seal(),
          equals({1, 2}));
    });

    test('has copyWith skip', () {
      expect(FreezedSet.of({1, 2, 3}).copyWith.skip(2).seal(), equals({3}));
    });

    test('has copyWith skipWhile', () {
      expect(
          FreezedSet.of({1, 2, 3})
              .copyWith
              .skipWhile(
                (p0) => p0 <= 2,
              )
              .seal(),
          equals({3}));
    });
  });
}
