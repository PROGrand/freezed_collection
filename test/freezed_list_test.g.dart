// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'freezed_list_test.dart';

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
      json['name'] as String,
      FreezedList<Three>.fromJson(json['threes'] as List<dynamic>,
          (value) => Three.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$TwoToJson(_Two instance) => <String, dynamic>{
      'name': instance.name,
      'threes': instance.threes,
    };

_Three _$ThreeFromJson(Map<String, dynamic> json) => _Three(
      json['name'] as String,
    );

Map<String, dynamic> _$ThreeToJson(_Three instance) => <String, dynamic>{
      'name': instance.name,
    };

_Collector _$CollectorFromJson(Map<String, dynamic> json) => _Collector(
      FreezedList<Numbers>.fromJson(json['numbers'] as List<dynamic>,
          (value) => Numbers.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$CollectorToJson(_Collector instance) => <String, dynamic>{
      'numbers': instance.numbers,
    };

_Numbers _$NumbersFromJson(Map<String, dynamic> json) => _Numbers(
      FreezedList<int>.fromJson(json['values'] as List<dynamic>, (value) => (value as num).toInt()),
    );

Map<String, dynamic> _$NumbersToJson(_Numbers instance) => <String, dynamic>{
      'values': instance.values,
    };
