// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_collection_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_One _$$_OneFromJson(Map<String, dynamic> json) => _$_One(
      json['name'] as String,
      Two.fromJson(json['two'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OneToJson(_$_One instance) => <String, dynamic>{
      'name': instance.name,
      'two': instance.two,
    };

_$_Two _$$_TwoFromJson(Map<String, dynamic> json) => _$_Two(
      json['name'] as String,
      FreezedList<Three>.fromJson(json['threes'] as List<dynamic>,
          (value) => Three.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$_TwoToJson(_$_Two instance) => <String, dynamic>{
      'name': instance.name,
      'threes': instance.threes,
    };

_$_Three _$$_ThreeFromJson(Map<String, dynamic> json) => _$_Three(
      json['name'] as String,
    );

Map<String, dynamic> _$$_ThreeToJson(_$_Three instance) => <String, dynamic>{
      'name': instance.name,
    };

_$_Collector _$$_CollectorFromJson(Map<String, dynamic> json) => _$_Collector(
      FreezedList<Numbers>.fromJson(json['numbers'] as List<dynamic>,
          (value) => Numbers.fromJson(value as Map<String, dynamic>)),
    );

Map<String, dynamic> _$$_CollectorToJson(_$_Collector instance) =>
    <String, dynamic>{
      'numbers': instance.numbers,
    };

_$_Numbers _$$_NumbersFromJson(Map<String, dynamic> json) => _$_Numbers(
      FreezedList<int>.fromJson(
          json['values'] as List<dynamic>, (value) => value as int),
    );

Map<String, dynamic> _$$_NumbersToJson(_$_Numbers instance) =>
    <String, dynamic>{
      'values': instance.values,
    };
