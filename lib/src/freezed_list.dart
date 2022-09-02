import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_collection/src/copy_on_write_list.dart';

part 'freezed_list.freezed.dart';

@Freezed(
    genericArgumentFactories: true,
    toJson: false,
    fromJson: false,
    copyWith: false)
class FreezedList<T> with _$FreezedList<T> implements Iterable<T> {
  const FreezedList._();

  const factory FreezedList(List<T> list) = _FreezedList<T>;

  @override
  String toString() => list.toString();

  // region List
  /// Returns as an immutable list.
  ///
  /// Useful when producing or using APIs that need the [List] interface. This
  /// differs from [toList] where mutations are explicitly disallowed.
  List<T> asList() => List<T>.unmodifiable(list);

  // List.

  /// As [List.elementAt].
  T operator [](int index) => list[index];

  /// As [List.+].
  FreezedList<T> operator +(FreezedList<T> other) =>
      _FreezedList<T>(list + other.list);

  /// As [List.length].
  @override
  int get length => list.length;

  /// As [List.reversed].
  Iterable<T> get reversed => list.reversed;

  /// As [List.indexOf].
  int indexOf(T element, [int start = 0]) => list.indexOf(element, start);

  /// As [List.lastIndexOf].
  int lastIndexOf(T element, [int? start]) => list.lastIndexOf(element, start);

  /// As [List.indexWhere].
  int indexWhere(bool Function(T) test, [int start = 0]) =>
      list.indexWhere(test, start);

  /// As [List.lastIndexWhere].
  int lastIndexWhere(bool Function(T) test, [int? start]) =>
      list.lastIndexWhere(test, start);

  /// As [List.sublist] but returns a `FreezedList<T>`.
  FreezedList<T> sublist(int start, [int? end]) =>
      _FreezedList<T>(list.sublist(start, end));

  /// As [List.getRange].
  Iterable<T> getRange(int start, int end) => list.getRange(start, end);

  /// As [List.asMap].
  Map<int, T> asMap() => list.asMap();

  // endregion

  //region Iterable
  @override
  Iterator<T> get iterator => list.iterator;

  @override
  Iterable<E> map<E>(E Function(T) f) => list.map(f);

  @override
  Iterable<T> where(bool Function(T) test) => list.where(test);

  @override
  Iterable<E> whereType<E>() => list.whereType<E>();

  @override
  Iterable<E> expand<E>(Iterable<E> Function(T) f) => list.expand(f);

  @override
  bool contains(Object? element) => list.contains(element);

  @override
  void forEach(void Function(T) f) => list.forEach(f);

  @override
  T reduce(T Function(T, T) combine) => list.reduce(combine);

  @override
  E fold<E>(E initialValue, E Function(E, T) combine) =>
      list.fold(initialValue, combine);

  @override
  Iterable<T> followedBy(Iterable<T> other) => list.followedBy(other);

  @override
  bool every(bool Function(T) test) => list.every(test);

  @override
  String join([String separator = '']) => list.join(separator);

  @override
  bool any(bool Function(T) test) => list.any(test);

  /// As [Iterable.toList].
  ///
  /// Note that the implementation is efficient: it returns a copy-on-write
  /// wrapper around the data from this `FreezedList`. So, if no mutations are
  /// made to the result, no copy is made.
  ///
  /// This allows efficient use of APIs that ask for a mutable collection
  /// but don't actually mutate it.
  @override
  List<T> toList({bool growable = true}) => CopyOnWriteList<T>(list, growable);

  @override
  Set<T> toSet() => list.toSet();

  @override
  bool get isEmpty => list.isEmpty;

  @override
  bool get isNotEmpty => list.isNotEmpty;

  @override
  Iterable<T> take(int n) => list.take(n);

  @override
  Iterable<T> takeWhile(bool Function(T) test) => list.takeWhile(test);

  @override
  Iterable<T> skip(int n) => list.skip(n);

  @override
  Iterable<T> skipWhile(bool Function(T) test) => list.skipWhile(test);

  @override
  T get first => list.first;

  @override
  T get last => list.last;

  @override
  T get single => list.single;

  @override
  T firstWhere(bool Function(T) test, {T Function()? orElse}) =>
      list.firstWhere(test, orElse: orElse);

  @override
  T lastWhere(bool Function(T) test, {T Function()? orElse}) =>
      list.lastWhere(test, orElse: orElse);

  @override
  T singleWhere(bool Function(T) test, {T Function()? orElse}) =>
      list.singleWhere(test, orElse: orElse);

  @override
  T elementAt(int index) => list.elementAt(index);

  @override
  Iterable<E> cast<E>() => Iterable.castFrom<T, E>(list);

  //endregion

  factory FreezedList.fromJson(
          List<dynamic> json, T Function(Object?) fromJsonT) =>
      FreezedList(json.map(fromJsonT).toList());

  List<dynamic> toJson() => list.map((e) => e).toList();

  @JsonKey(ignore: true)
  $FreezedListCopyWith<T, FreezedList<T>> get copyWith =>
      $FreezedListCopyWith<T, FreezedList<T>>(this, _$identity);
}

class $FreezedListCopyWith<T, $Res> {
  final FreezedList<T> __value;
  final $Res Function(FreezedList<T>) __then;

  $FreezedListCopyWith(this.__value, this.__then);

  FreezedList<T> get _value => __value;

  $Res call([Object? list = freezed]) {
    return __then(
        FreezedList<T>(list == freezed ? _value.list : list as List<T>));
  }

  /// Replace element according to what() with newElement.
  $Res replaceFirst(T newElement, bool Function(T element) what) {
    final index = _value.list.indexWhere((element) => what(element));
    if (-1 != index) {
      var newList = _value.list.toList();
      newList[index] = newElement;
      return __then(FreezedList<T>(newList));
    } else {
      return __then(FreezedList<T>(_value.list));
    }
  }
}
