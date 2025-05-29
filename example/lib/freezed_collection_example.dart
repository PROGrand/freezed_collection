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
          assistants: FreezedList(
              [Assistant(age: 1, name: '1'), Assistant(age: 3, name: '3')])));

  final jsonString = json.encode(company);
  final restoredCompany = Company.fromJson(json.decode(jsonString));

  print(restoredCompany);

  Company? newCompany = company.copyWith.director.assistants.replaceFirstWhere(
    Assistant(age: 2, name: '2'),
    (element) => element.age == 1,
  );

  Company? newCompany2 =
      newCompany.copyWith.director.assistants.replaceFirstWhere(
    Assistant(age: 1, name: '1'),
    (element) => element.age == 2,
  );

  printT(company);
  printT(newCompany);
  printT(newCompany2);

  print('Is 1 equal to 2? ${newCompany == company}');
  print('Is 1 equal to 3? ${newCompany2 == company}');
}
