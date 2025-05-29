// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'director.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Director _$DirectorFromJson(Map<String, dynamic> json) => _Director(
      name: json['name'] as String?,
      assistants: FreezedList<Assistant>.fromJson(
          json['assistants'] as List<dynamic>,
          (value) => Assistant.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$DirectorToJson(_Director instance) => <String, dynamic>{
      'name': instance.name,
      'assistants': instance.assistants,
    };
