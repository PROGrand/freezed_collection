// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'director.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Director _$$_DirectorFromJson(Map<String, dynamic> json) => _$_Director(
      name: json['name'] as String?,
      assistants: FreezedList<Assistant>.fromJson(
          json['assistants'] as List<dynamic>,
          (value) => Assistant.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$_DirectorToJson(_$_Director instance) =>
    <String, dynamic>{
      'name': instance.name,
      'assistants': instance.assistants,
    };
