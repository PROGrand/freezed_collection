import 'dart:convert';

import 'package:freezed_collection/freezed_collection.dart';

import 'assistant.dart';
import 'company.dart';
import 'director.dart';

void printT<T>(T company) => print(json.encode(company));

void main() {
  final company = Company(
      name: '1',
      director: Director(
          name: 'director1',
          assistants: FreezedMap({
            1: Assistant(age: 1, name: '1'),
            3: Assistant(age: 2, name: '2'),
          })));

  printT(company);

  final jsonString = json.encode(company);
  final restoredCompany = Company.fromJson(json.decode(jsonString));

  printT(restoredCompany);

  final newCompany = company.copyWith.director.assistants
      .updateValue(3, (p0) => Assistant(age: 3, name: '3'))
      .seal();

  Company? newCompany2 = newCompany.copyWith.director.assistants
      .updateAllValues((p0, p1) => p1.copyWith(age: 21))
      .seal();

  printT(newCompany);
  printT(newCompany2);

  print('Is 1 equal to 2? ${company == restoredCompany} (should be true)');
  print('Is 2 equal to 3? ${restoredCompany == newCompany} (should be false)');
  print('Is 3 equal to 4? ${newCompany == newCompany2} (should be false)');
}
