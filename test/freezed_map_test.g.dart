// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'freezed_map_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_One _$OneFromJson(Map<String, dynamic> json) => _One(
      json['name'] as String,
      Two.fromJson(json['two'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OneToJson(_One instance) => <String, dynamic>{
      'name': instance.name,
      'two': instance.two,
    };

_Two _$TwoFromJson(Map<String, dynamic> json) => _Two(
      (json['index'] as num).toInt(),
      FreezedMap<String, int>.fromJson(json['three'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TwoToJson(_Two instance) => <String, dynamic>{
      'index': instance.index,
      'three': instance.three,
    };
