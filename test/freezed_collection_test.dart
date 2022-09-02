import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_collection/freezed_collection.dart';
import 'package:test/test.dart';

part 'freezed_collection_test.freezed.dart';

part 'freezed_collection_test.g.dart';

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

@freezed
class Collector with _$Collector {
  const factory Collector(FreezedList<Numbers> numbers) = _Collector;

  factory Collector.fromJson(Map<String, dynamic> json) =>
      _$CollectorFromJson(json);
}

@freezed
class Numbers with _$Numbers {
  const factory Numbers(FreezedList<int> values) = _Numbers;

  factory Numbers.fromJson(Map<String, dynamic> json) =>
      _$NumbersFromJson(json);
}

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Freezed Test', () {
      final var1 = One(
          '1', Two('2', FreezedList([Three('31'), Three('32'), Three('33')])));
      final var2 = One(
          '1', Two('2', FreezedList([Three('31'), Three('32'), Three('33')])));
      final var21 = var2.copyWith();
      expect(var1, equals(var2));
      expect(var1, equals(var21));
      final var3 = var21.copyWith
          .two(name: '21')
          .copyWith
          .two
          .threes
          .replaceFirstWhere(Three('XXX'), (element) => element.name == '31');
      expect(var3, isNot(var21));
      final var4 = var3.copyWith
          .two(name: '2')
          .copyWith
          .two
          .threes
          .replaceFirstWhere(Three('31'), (element) => element.name == 'XXX');
      expect(var4, equals(var21));
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
      for (var v in var1) {
        for (var w in v.numbers) {
          for (var x in w.values) {
            n += x;
          }
        }
      }

      var m = 0;
      for (var v in var2) {
        for (var w in v.numbers) {
          for (var x in w.values) {
            m += x;
          }
        }
      }

      expect(n, equals((1 + 2 + 3 + 4) * 4));
      expect(m, equals((5 + 6 + 3 + 4) * 4));
    });
  });
}
