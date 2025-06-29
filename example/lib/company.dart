import 'package:freezed_annotation/freezed_annotation.dart';

import 'director.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
abstract class Company with _$Company {
  factory Company({String? name, required Director director}) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
