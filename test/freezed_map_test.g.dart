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
      FreezedMap<String, int>.fromJson(
          json['three'] as Map<String, dynamic>, (value) => (value as num).toInt()),
    );

Map<String, dynamic> _$TwoToJson(_Two instance) => <String, dynamic>{
      'index': instance.index,
      'three': instance.three,
    };

_IntMap _$IntMapFromJson(Map<String, dynamic> json) => _IntMap(
      (json['index'] as num).toInt(),
      FreezedMap<int, int>.fromJson(
          json['map'] as Map<String, dynamic>, (value) => (value as num).toInt()),
    );

Map<String, dynamic> _$IntMapToJson(_IntMap instance) => <String, dynamic>{
      'index': instance.index,
      'map': instance.map,
    };
