/*
 * Copyright (c) 2025. Vladimir E. Koltunov, mtbo.org
 * Please see the AUTHORS file for details.
 * All rights reserved. Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

//dart pub global activate coverage
//dart pub global run coverage:test_with_coverage
import 'dart:convert';
import 'dart:math' show Random;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_collection/freezed_collection.dart';
import 'package:test/test.dart';

part 'freezed_list_test.freezed.dart';
part 'freezed_list_test.g.dart';

@freezed
abstract class One with _$One {
  const factory One(String name, Two two) = _One;

  factory One.fromJson(Map<String, dynamic> json) => _$OneFromJson(json);
}

@freezed
abstract class Two with _$Two {
  const factory Two(String name, FreezedList<Three> threes) = _Two;

  factory Two.fromJson(Map<String, dynamic> json) => _$TwoFromJson(json);
}

@freezed
abstract class Three with _$Three {
  const factory Three(String name) = _Three;

  factory Three.fromJson(Map<String, dynamic> json) => _$ThreeFromJson(json);
}

@freezed
abstract class Collector with _$Collector {
  const factory Collector(FreezedList<Numbers> numbers) = _Collector;

  factory Collector.fromJson(Map<String, dynamic> json) =>
      _$CollectorFromJson(json);
}

@freezed
abstract class Numbers with _$Numbers {
  const factory Numbers(FreezedList<int> values) = _Numbers;

  factory Numbers.fromJson(Map<String, dynamic> json) =>
      _$NumbersFromJson(json);
}

void main() {
  group('Demo tests', () {
    test('FreezedList have replaceFirstWhere', () {
      final list = FreezedList(['1', '2', '3']);
      final list2 = list.copyWith
          .replaceFirstWhere(
            'newElement',
            (element) => element == '1',
          )
          .seal();

      expect(list2, equals(['newElement', '2', '3']));
    });

    test('FreezedList has deep copyWith', () {
      final one = One(
          '1', Two('2', FreezedList([Three('31'), Three('32'), Three('31')])));

      final abc =
          one.copyWith.two.threes([Three('a'), Three('b'), Three('c')]).seal();

      expect(abc.two.threes.map((p0) => p0.name), equals(['a', 'b', 'c']));
    });

    test('Freezed Test', () {
      final one1 = One(
          '1', Two('2', FreezedList([Three('31'), Three('32'), Three('33')])));
      final one2 = One(
          '1', Two('2', FreezedList([Three('31'), Three('32'), Three('33')])));
      final one2copy = one2.copyWith();
      expect(one1, equals(one2));
      expect(one1, equals(one2copy));

      final one2copy1 = one2copy.copyWith.two.threes
          .replaceFirstWhere(Three('XXX'), (element) => element.name == '31')
          .seal();

      expect(one2copy1, isNot(one2copy));
      expect(
          one2copy1.two.threes.map(
            (p0) => p0.name,
          ),
          equals(['XXX', '32', '33']));

      final one2copy2 = one2copy.copyWith
          .two(name: '21')
          .copyWith
          .two
          .threes
          .replaceFirstWhere(Three('XXX'), (element) => element.name == '31')
          .seal();
      expect(one2copy2, isNot(one2copy));
      final var4 = one2copy2.copyWith
          .two(name: '2')
          .copyWith
          .two
          .threes
          .replaceFirstWhere(Three('31'), (element) => element.name == 'XXX')
          .seal();
      expect(var4, equals(one2copy));
    });

    test('Plain Test', () {
      final var1 = FreezedList<Collector>(
        [
          Collector(
            FreezedList(
              [
                Numbers(FreezedList([1, 1, 1, 1])),
                Numbers(FreezedList([2, 2, 2, 2]))
              ],
            ),
          ),
          Collector(
            FreezedList(
              [
                Numbers(FreezedList([3, 3, 3, 3])),
                Numbers(FreezedList([4, 4, 4, 4]))
              ],
            ),
          ),
        ],
      );

      final var2 = var1.copyWith
          .replaceFirstWhere(
              Collector(FreezedList(
                [
                  Numbers(FreezedList([5, 5, 5, 5])),
                  Numbers(FreezedList([6, 6, 6, 6]))
                ],
              )),
              (element) => element.numbers[0].values[0] == 1)
          .seal();

      var n = 0;
      for (final v in var1) {
        for (final w in v.numbers) {
          for (final x in w.values) {
            n += x;
          }
        }
      }

      var m = 0;
      for (final v in var2) {
        for (final w in v.numbers) {
          for (final x in w.values) {
            m += x;
          }
        }
      }

      expect(n, equals((1 + 2 + 3 + 4) * 4));
      expect(m, equals((5 + 6 + 3 + 4) * 4));
    });
  });

  group('FreezedList', () {
    test('has replaceFirstWhere', () {
      final list = FreezedList([1, 2, 1]);
      final list2 =
          list.copyWith.replaceFirstWhere(0, (element) => element == 1).seal();

      expect(list, equals([1, 2, 1]));
      expect(list2, equals([0, 2, 1]));
    });

    test('has replaceFirstWhere -1', () {
      final list = FreezedList([1, 2, 1]);
      final list2 =
          list.copyWith.replaceFirstWhere(0, (element) => element == 7).seal();

      expect(list, equals([1, 2, 1]));
      expect(list2, equals([1, 2, 1]));
    });

    test('has call', () {
      final list = FreezedList([1, 2]);
      final list2 = list.copyWith([4, 5]).seal();

      expect(list, equals([1, 2]));
      expect(list2, equals([4, 5]));
    });

    test('has call with null', () {
      final list = FreezedList([1, 2]);
      final list2 = list.copyWith([]).seal();

      expect(list, equals([1, 2]));
      expect(list2, equals([]));
    });

    test('has add', () {
      final list = FreezedList([1, 2]);
      final list2 = list.copyWith.add(3).seal();

      expect(list, equals([1, 2]));
      expect(list2, equals([1, 2, 3]));
    });

    test('has addAll', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.addAll([4, 5]).seal();

      expect(list, equals([1, 2, 3]));
      expect(list2, equals([1, 2, 3, 4, 5]));
    });

    test('has clear', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.clear().seal();

      expect(list, equals([1, 2, 3]));
      expect(list2, equals([]));
    });

    test('has fillRange', () {
      final list = FreezedList([1, 1, 1, 1, 1]);
      final list2 = list.copyWith.fillRange(1, 3, 0).seal();

      expect(list, equals([1, 1, 1, 1, 1]));
      expect(list2, equals([1, 0, 0, 1, 1]));
    });

    test('has insert', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.insert(0, 0).seal();

      expect(list, equals([1, 2, 3]));
      expect(list2, equals([0, 1, 2, 3]));
    });

    test('has insertAll', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.insertAll(1, [0, 0, 0]).seal();

      expect(list, equals([1, 2, 3]));
      expect(list2, equals([1, 0, 0, 0, 2, 3]));
    });

    test('has remove', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = (list.copyWith..remove(2)).seal();

      expect(list, equals([1, 2, 3]));
      expect(list2, equals([1, 3]));
    });

    test('has removeAt', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = (list.copyWith..removeAt(1)).seal();

      expect(list, equals([1, 2, 3]));
      expect(list2, equals([1, 3]));
    });

    test('has removeFirstWhere', () {
      final list = FreezedList([1, 2, 1]);
      final list2 =
          list.copyWith.removeFirstWhere((element) => element == 1).seal();

      expect(list, equals([1, 2, 1]));
      expect(list2, equals([2, 1]));
    });

    test('has removeFirstWhere -1', () {
      final list = FreezedList([1, 2, 1]);
      final list2 =
          list.copyWith.removeFirstWhere((element) => element == 7).seal();

      expect(list, equals([1, 2, 1]));
      expect(list2, equals([1, 2, 1]));
    });

    test('has removeLast', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = (list.copyWith..removeLast()).seal();

      expect(list, equals([1, 2, 3]));
      expect(list2, equals([1, 2]));
    });

    test('has removeRange', () {
      final list = FreezedList([1, 2, 3, 4, 5]);
      final list2 = list.copyWith.removeRange(1, 3).seal();

      expect(list, equals([1, 2, 3, 4, 5]));
      expect(list2, equals([1, 4, 5]));
    });

    test('has removeWhere', () {
      final list = FreezedList([1, 2, 1]);
      final list2 = list.copyWith.removeWhere((element) => element == 1).seal();

      expect(list, equals([1, 2, 1]));
      expect(list2, equals([2]));
    });

    test('has retainWhere', () {
      final list = FreezedList([1, 2, 1]);
      final list2 = list.copyWith.retainWhere((element) => element == 2).seal();

      expect(list, equals([1, 2, 1]));
      expect(list2, equals([2]));
    });

    test('has set', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith..[1] = 0;

      expect(list, equals([1, 2, 3]));
      expect(list2.seal(), equals([1, 0, 3]));
    });

    test('has setAll', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.setAll(1, [4, 5]).seal();

      expect(list, equals([1, 2, 3]));
      expect(list2, equals([1, 4, 5]));
    });

    test('has setLast', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.setLast(0).seal();
      expect(list2, equals([1, 2, 0]));

      final list3 = (list.copyWith..last = 3).seal();
      expect(list3, equals([1, 2, 3]));

      expect(list, equals([1, 2, 3]));
    });

    test('has setLength', () {
      final list = FreezedList<int?>([1, 2, 3]);
      final list2 = list.copyWith.setLength(5).seal();
      expect(list2, equals([1, 2, 3, null, null]));

      final list3 = (list.copyWith..length = 4).seal();
      expect(list3, equals([1, 2, 3, null]));

      expect(list, equals([1, 2, 3]));
    });

    test('has setFirst', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.setFirst(0).seal();

      expect(list, equals([1, 2, 3]));
      expect(list2, equals([0, 2, 3]));
    });

    test('has setRange', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.setRange(1, 3, [4, 5]).seal();

      expect(list, equals([1, 2, 3]));
      expect(list2, equals([1, 4, 5]));
    });

    test('has sort', () {
      final list = FreezedList([3, 1, 2]);
      final list2 = list.copyWith.sort((a, b) => a.compareTo(b)).seal();

      expect(list, equals([3, 1, 2]));
      expect(list2, equals([1, 2, 3]));
    });

    test('has shuffle', () {
      final list = FreezedList([1, 2, 3, 4, 5]);
      final random = _NoRandom();
      final list2 = list.copyWith.shuffle(random).seal();

      expect(list, equals([1, 2, 3, 4, 5]));
      expect(list2, equals([1, 2, 3, 4, 5]..shuffle(random)));
    });

    test('has replaceRange', () {
      final list = FreezedList([1, 2, 3, 4, 5]);
      final list2 = list.copyWith.replaceRange(1, 3, [7, 8, 9, 10]).seal();

      expect(list, equals([1, 2, 3, 4, 5]));
      expect(list2, equals([1, 7, 8, 9, 10, 4, 5]));
    });

    test('has of', () {
      final list = FreezedList.of([1, 2, 3, 4, 5]);
      expect(list, equals([1, 2, 3, 4, 5]));
    });

    test('has hashCode', () {
      final list = FreezedList.of([1, 2, 3, 4, 5]);
      final listCopy = list.copyWith.seal();
      final list2 = FreezedList.of([1, 2, 3, 4, 6]);
      expect(list.hashCode, equals(listCopy.hashCode));
      expect(list.hashCode, isNot(equals(list2.hashCode)));
    });

    test('has ==', () {
      expect(FreezedList.of([1, 2]), equals(FreezedList.of([1, 2])));
      expect(FreezedList.of([1, 2]), isNot(equals(FreezedList.of([1, 3]))));
    });

    test('has toString', () {
      expect(FreezedList.of([1, 2]).toString(), isNotEmpty);
    });

    test('has asList', () {
      expect(() => FreezedList.of([1, 2]).asList().removeAt(0),
          throwsUnsupportedError);
    });

    test('has +', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = FreezedList([4, 5]);

      expect(list + list2, equals([1, 2, 3, 4, 5]));
    });

    test('has reversed', () {
      final list = FreezedList([1, 2, 3]);

      expect(list.reversed, equals([3, 2, 1]));
    });

    test('has index', () {
      final list = FreezedList([1, 2, 3, 2, 3]);

      expect(list.indexOf(2), equals(1));
      expect(list.lastIndexOf(2), equals(3));
      expect(list.indexWhere((p0) => p0 > 2), equals(2));
      expect(list.lastIndexWhere((p0) => p0 > 2), equals(4));
    });

    test('has sublist', () {
      final list = FreezedList([1, 2, 3, 2, 3]);

      expect(list.sublist(1), equals([2, 3, 2, 3]));
      expect(list.sublist(1, 3), equals([2, 3]));
      expect(() => list.sublist(7), throwsRangeError);
      expect(list.sublist(1, 3), isA<FreezedList>());
    });

    test('has getRange', () {
      final list = FreezedList([1, 2, 3, 2, 3]);

      expect(list.getRange(1, 3), equals([2, 3]));
      expect(list.getRange(1, 3), isA<Iterable>());
    });

    test('has asMap', () {
      final list = FreezedList([1, 2, 3]);

      expect(list.asMap(), equals({0: 1, 1: 2, 2: 3}));
    });

    test('has where', () {
      final list = FreezedList([1, 2, 3]);

      expect(list.where((p0) => p0 % 2 == 1), equals([1, 3]));
    });

    test('has whereType', () {
      final list = FreezedList([1, 2, '3']);

      expect(list.whereType<String>(), equals(['3']));
    });

    test('has expand', () {
      final list = FreezedList([1, 2, 3]);

      expect(list.expand((p0) => [p0 + 10, p0 * 10]),
          equals([11, 10, 12, 20, 13, 30]));
    });

    test('has contains', () {
      expect(FreezedList.of([1, 2, 3]).contains(1), isTrue);
      expect(FreezedList.of([1, 2, 3]).contains(4), isFalse);
      //ignore: collection_methods_unrelated_type
      expect(FreezedList.of([1, 2, 3]).contains('1'), isFalse);
    });

    test('has for-loop', () {
      var cnt = 0;
      for (final n in FreezedList.of([1, 2, 3])) {
        cnt += n;
      }
      expect(cnt, equals(6));
    });

    test('has forEach', () {
      var cnt = 0;
      // ignore: avoid_function_literals_in_foreach_calls
      FreezedList.of([1, 2, 3]).forEach((p0) => cnt += p0);

      expect(cnt, equals(6));
    });

    test('has reduce', () {
      expect(FreezedList.of([1, 2, 3]).reduce((p0, p1) => p0 * p1), equals(6));
    });

    test('has fold', () {
      expect(
          FreezedList.of([1, 2, 3]).fold(10, (p0, p1) => p0 * p1), equals(60));
    });

    test('has every', () {
      expect(FreezedList.of([1, 2, 3]).every((p0) => p0 < 0), isFalse);
      expect(FreezedList.of([1, 2, 3]).every((p0) => p0 > 0), isTrue);
    });

    test('has join', () {
      expect(FreezedList.of([1, 2, 3]).join(' '), equals('1 2 3'));
    });

    test('has any', () {
      expect(FreezedList.of([1, 2, '3']).any((p0) => p0 is String), isTrue);
      expect(FreezedList.of([1, 2, 3]).any((p0) => p0 < 0), isFalse);
    });

    test('has followedBy', () {
      expect(FreezedList.of([1, 2, 3]).followedBy([4, 5]),
          equals([1, 2, 3, 4, 5]));
    });

    test('has toList', () {
      expect(FreezedList.of([1, 2, 3]).toList(),
          isA<List>().having((p0) => p0, 'elements', [1, 2, 3]));
    });

    test('has toSet', () {
      expect(FreezedList.of([1, 2, 3]).toSet(),
          isA<Set>().having((p0) => p0, 'elements', [1, 2, 3]));
    });

    test('has isEmpty', () {
      expect(FreezedList.of([1, 2, 3]).isEmpty, isFalse);
      expect(FreezedList.of([]).isEmpty, isTrue);
      expect(FreezedList.of([1, 2, 3]).isNotEmpty, isTrue);
      expect(FreezedList.of([]).isNotEmpty, isFalse);
    });

    test('has take', () {
      expect(FreezedList.of([1, 2, 3, 4, 5]).take(2), equals([1, 2]));
    });

    test('has takeWhile', () {
      expect(FreezedList.of([1, 2, 3, 4, 5]).takeWhile((p0) => p0 != 3),
          equals([1, 2]));
    });

    test('has skip', () {
      expect(FreezedList.of([1, 2, 3, 4, 5]).skip(2), equals([3, 4, 5]));
    });

    test('has skipWhile', () {
      expect(FreezedList.of([1, 2, 3, 4, 5]).skipWhile((p0) => p0 != 3),
          equals({3, 4, 5}));
    });

    test('has first', () {
      expect(FreezedList.of([1, 2, 3, 4, 5]).first, equals(1));
    });

    test('has last', () {
      expect(FreezedList.of([1, 2, 3, 4, 5]).last, equals(5));
    });

    test('has single', () {
      expect(FreezedList.of([1]).single, equals(1));
      expect(() => FreezedList.of([1, 2]).single, throwsStateError);
      expect(() => FreezedList.of({}).single, throwsStateError);
    });

    test('has firstWhere', () {
      expect(FreezedList.of([1, 2, 3]).firstWhere((p0) => p0 == 2), equals(2));
      expect(() => FreezedList.of([1, 2]).firstWhere((p0) => p0 == 100),
          throwsStateError);
    });

    test('has lastWhere', () {
      expect(
          FreezedList.of([1, 2, 3]).lastWhere((p0) => p0 % 2 == 1), equals(3));
      expect(() => FreezedList.of([1, 2]).lastWhere((p0) => p0 == 100),
          throwsStateError);
    });

    test('has singleWhere', () {
      expect(FreezedList.of([1, 2, 3]).singleWhere((p0) => p0 == 2), equals(2));
      expect(() => FreezedList.of([1, 2]).singleWhere((p0) => p0 == 100),
          throwsStateError);
    });

    test('has elementAt', () {
      expect(FreezedList.of([1, 2, 3]).elementAt(1), equals(2));
      expect(() => FreezedList.of([1, 2]).elementAt(100), throwsRangeError);
    });

    test('has cast', () {
      expect(FreezedList.of([1, 2]).cast<int>(), equals([1, 2]));
    });

    test('has fromJson', () {
      expect(FreezedList.fromJson(json.decode('[1, 2, 3]'), (p0) => p0),
          equals([1, 2, 3]));
    });

    test('has toJson', () {
      final s = json.encode(FreezedList.of([1, 2, 3]).toJson());

      expect(
          FreezedList.fromJson(json.decode(s), (p0) => p0), equals([1, 2, 3]));
    });

    test('has copyWith update', () {
      final s = List.of([0]);
      var freezedList = FreezedList.of([1, 2, 3]);
      freezedList.copyWith.update((p0) => s.addAll(p0.seal()));

      expect(s, equals([0, 1, 2, 3]));

      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith []', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(freezedList.copyWith[1], equals(2));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith []=', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect((freezedList.copyWith..[1] = 7).seal(), equals([1, 7, 3]));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has type error', () {
      expect(() => FreezedList<int>(['1']), throwsA(TypeMatcher<TypeError>()));
    });

    test('has copyWith length', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(freezedList.copyWith.length, equals(3));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith isEmpty', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(freezedList.copyWith.isEmpty, isFalse);
      var freezedList2 = FreezedList.of([]);
      expect(freezedList2.copyWith.isEmpty, isTrue);
      expect(freezedList, equals([1, 2, 3]));
      expect(freezedList2, equals([]));
    });

    test('has copyWith isNotEmpty', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(freezedList.copyWith.isNotEmpty, isTrue);
      var freezedList2 = FreezedList.of([]);
      expect(freezedList2.copyWith.isNotEmpty, isFalse);
      expect(freezedList, equals([1, 2, 3]));
      expect(freezedList2, equals([]));
    });

    test('has copyWith remove', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect((freezedList.copyWith..remove(1)).seal(), equals([2, 3]));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith addAll', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(
          freezedList.copyWith.addAll({4, 5}).seal(), equals([1, 2, 3, 4, 5]));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith where', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(freezedList.copyWith.where((p0) => p0 < 3).seal(), equals([1, 2]));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith map', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(
          freezedList.copyWith.map((p0) => p0 + 1).seal(), equals([2, 3, 4]));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith expand', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(freezedList.copyWith.expand((p0) => [p0 * 10, p0 * 20]).seal(),
          equals([10, 20, 20, 40, 30, 60]));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith take', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(freezedList.copyWith.take(2).seal(), equals([1, 2]));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith takeWhile', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(freezedList.copyWith.takeWhile((p0) => p0 <= 2).seal(),
          equals([1, 2]));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith skip', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(freezedList.copyWith.skip(2).seal(), equals([3]));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith skipWhile', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(
          freezedList.copyWith.skipWhile((p0) => p0 <= 2).seal(), equals([3]));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith first', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(freezedList.copyWith.first, equals(1));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith first=', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect((freezedList.copyWith..first = 7).seal(), equals([7, 2, 3]));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith last', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect(freezedList.copyWith.last, equals(3));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith reverse', () {
      var freezedList = FreezedList.of([1, 2, 3]);
      expect((freezedList.copyWith.reverse()).seal(), equals([3, 2, 1]));
      expect(freezedList, equals([1, 2, 3]));
    });

    test('has copyWith sublist', () {
      var freezedList = FreezedList.of([1, 2, 3, 4, 5]);

      expect((freezedList.copyWith.sublist(1, 3)).seal(), equals([2, 3]));

      expect(freezedList, equals([1, 2, 3, 4, 5]));
    });
  });
}

class _NoRandom implements Random {
  @override
  bool nextBool() => true;

  @override
  double nextDouble() => 0.0;

  @override
  int nextInt(int max) => 1;
}
