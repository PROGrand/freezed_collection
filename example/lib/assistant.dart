import 'package:freezed_annotation/freezed_annotation.dart';

part 'assistant.freezed.dart';
part 'assistant.g.dart';

@freezed
abstract class Assistant with _$Assistant {
  factory Assistant({String? name, int? age}) = _Assistant;

  factory Assistant.fromJson(Map<String, dynamic> json) => _$AssistantFromJson(json);
}
