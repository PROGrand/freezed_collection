// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'director.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Director _$DirectorFromJson(Map<String, dynamic> json) => _Director(
      name: json['name'] as String?,
      assistants: FreezedMap<int, Assistant>.fromJson(json['assistants'] as Map<String, dynamic>,
          (value) => Assistant.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$DirectorToJson(_Director instance) => <String, dynamic>{
      'name': instance.name,
      'assistants': instance.assistants,
    };
