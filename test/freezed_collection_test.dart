//dart pub global activate coverage
//dart pub global run coverage:test_with_coverage
import 'dart:math' show Random;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_collection/freezed_collection.dart';
import 'package:test/test.dart';

part 'freezed_collection_test.freezed.dart';
part 'freezed_collection_test.g.dart';

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

  factory Collector.fromJson(Map<String, dynamic> json) => _$CollectorFromJson(json);
}

@freezed
abstract class Numbers with _$Numbers {
  const factory Numbers(FreezedList<int> values) = _Numbers;

  factory Numbers.fromJson(Map<String, dynamic> json) => _$NumbersFromJson(json);
}

void main() {
  group('Demo tests', () {
    test('FreezedList have replaceFirstWhere', () {
      final list = FreezedList(['1', '2', '3']);
      final list2 = list.copyWith.replaceFirstWhere(
        'newElement',
        (element) => element == '1',
      );

      expect(list2, equals(['newElement', '2', '3']));
    });

    test('FreezedList has deep copyWith', () {
      final one = One('1', Two('2', FreezedList([Three('31'), Three('32'), Three('31')])));

      final abc = one.copyWith.two.threes(list: [Three('a'), Three('b'), Three('c')]);

      expect(abc.two.threes.map((p0) => p0.name), equals(['a', 'b', 'c']));
    });

    test('Freezed Test', () {
      final one1 = One('1', Two('2', FreezedList([Three('31'), Three('32'), Three('33')])));
      final one2 = One('1', Two('2', FreezedList([Three('31'), Three('32'), Three('33')])));
      final one2copy = one2.copyWith();
      expect(one1, equals(one2));
      expect(one1, equals(one2copy));

      final one2copy1 = one2copy.copyWith.two.threes
          .replaceFirstWhere(Three('XXX'), (element) => element.name == '31');

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
          .replaceFirstWhere(Three('XXX'), (element) => element.name == '31');
      expect(one2copy2, isNot(one2copy));
      final var4 = one2copy2.copyWith
          .two(name: '2')
          .copyWith
          .two
          .threes
          .replaceFirstWhere(Three('31'), (element) => element.name == 'XXX');
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

      final var2 = var1.copyWith.replaceFirstWhere(
          Collector(FreezedList(
            [
              Numbers(FreezedList([5, 5, 5, 5])),
              Numbers(FreezedList([6, 6, 6, 6]))
            ],
          )),
          (element) => element.numbers[0].values[0] == 1);

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
      final list2 = list.copyWith.replaceFirstWhere(0, (element) => element == 1);

      expect(list2, equals([0, 2, 1]));
    });

    test('has replaceFirstWhere -1', () {
      final list = FreezedList([1, 2, 1]);
      final list2 = list.copyWith.replaceFirstWhere(0, (element) => element == 7);

      expect(list2, equals([1, 2, 1]));
    });

    test('has call', () {
      final list = FreezedList([1, 2]);
      final list2 = list.copyWith(list: [4, 5]);

      expect(list2, equals([4, 5]));
    });

    test('has call with null', () {
      final list = FreezedList([1, 2]);
      final list2 = list.copyWith(list: null);

      expect(list2, equals([1, 2]));
    });

    test('has add', () {
      final list = FreezedList([1, 2]);
      final list2 = list.copyWith.add(3);

      expect(list2, equals([1, 2, 3]));
    });

    test('has addAll', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.addAll([4, 5]);

      expect(list2, equals([1, 2, 3, 4, 5]));
    });

    test('has clear', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.clear();

      expect(list2, equals([]));
    });

    test('has fillRange', () {
      final list = FreezedList([1, 1, 1, 1, 1]);
      final list2 = list.copyWith.fillRange(1, 3, 0);

      expect(list2, equals([1, 0, 0, 1, 1]));
    });

    test('has insert', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.insert(0, 0);

      expect(list2, equals([0, 1, 2, 3]));
    });

    test('has insertAll', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.insertAll(1, [0, 0, 0]);

      expect(list2, equals([1, 0, 0, 0, 2, 3]));
    });

    test('has remove', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.remove(2);

      expect(list2, equals([1, 3]));
    });

    test('has removeAt', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.removeAt(1);

      expect(list2, equals([1, 3]));
    });

    test('has removeFirstWhere', () {
      final list = FreezedList([1, 2, 1]);
      final list2 = list.copyWith.removeFirstWhere((element) => element == 1);

      expect(list2, equals([2, 1]));
    });

    test('has removeFirstWhere -1', () {
      final list = FreezedList([1, 2, 1]);
      final list2 = list.copyWith.removeFirstWhere((element) => element == 7);

      expect(list2, equals([1, 2, 1]));
    });

    test('has removeLast', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.removeLast();

      expect(list2, equals([1, 2]));
    });

    test('has removeRange', () {
      final list = FreezedList([1, 2, 3, 4, 5]);
      final list2 = list.copyWith.removeRange(1, 3);

      expect(list2, equals([1, 4, 5]));
    });

    test('has removeWhere', () {
      final list = FreezedList([1, 2, 1]);
      final list2 = list.copyWith.removeWhere(
        (element) => element == 1,
      );

      expect(list2, equals([2]));
    });

    test('has retainWhere', () {
      final list = FreezedList([1, 2, 1]);
      final list2 = list.copyWith.retainWhere((element) => element == 2);

      expect(list2, equals([2]));
    });

    test('has set', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.set(1, 0);

      expect(list2, equals([1, 0, 3]));
    });

    test('has setAll', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.setAll(1, [4, 5]);

      expect(list2, equals([1, 4, 5]));
    });

    test('has setLast', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.setLast(0);

      expect(list2, equals([1, 2, 0]));
    });

    test('has setLength', () {
      final list = FreezedList<int?>([1, 2, 3]);
      final list2 = list.copyWith.setLength(5);

      expect(list2, equals([1, 2, 3, null, null]));
    });

    test('has setFirst', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.setFirst(0);

      expect(list2, equals([0, 2, 3]));
    });

    test('has setRange', () {
      final list = FreezedList([1, 2, 3]);
      final list2 = list.copyWith.setRange(1, 3, [4, 5]);

      expect(list2, equals([1, 4, 5]));
    });

    test('has sort', () {
      final list = FreezedList([3, 1, 2]);
      final list2 = list.copyWith.sort((a, b) => a.compareTo(b));

      expect(list2, equals([1, 2, 3]));
    });

    test('has shuffle', () {
      final list = FreezedList([1, 2, 3, 4, 5]);
      final random = _NoRandom();
      final list2 = list.copyWith.shuffle(random);

      expect(list2, equals([1, 2, 3, 4, 5]..shuffle(random)));
    });

    test('has replaceRange', () {
      final list = FreezedList([1, 2, 3, 4, 5]);
      final list2 = list.copyWith.replaceRange(1, 3, [7, 8, 9, 10]);

      expect(list2, equals([1, 7, 8, 9, 10, 4, 5]));
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
