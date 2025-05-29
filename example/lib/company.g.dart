// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Company _$CompanyFromJson(Map<String, dynamic> json) => _Company(
      name: json['name'] as String?,
      director: Director.fromJson(json['director'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyToJson(_Company instance) => <String, dynamic>{
      'name': instance.name,
      'director': instance.director,
    };
