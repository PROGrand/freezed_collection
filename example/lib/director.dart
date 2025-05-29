import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_collection/freezed_collection.dart';

import 'assistant.dart';

part 'director.freezed.dart';
part 'director.g.dart';

@freezed
abstract class Director with _$Director {
  factory Director({String? name, required FreezedList<Assistant> assistants}) = _Director;

  factory Director.fromJson(Map<String, dynamic> json) => _$DirectorFromJson(json);
}
