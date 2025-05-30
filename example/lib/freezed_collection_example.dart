/*
 * Copyright (c) 2025. Vladimir E. Koltunov, mtbo.org
 * Please see the AUTHORS file for details.
 * All rights reserved. Use of this source code is governed by a BSD-style
 * license that can be found in the LICENSE file.
 */

import 'dart:convert';

import 'package:freezed_collection/freezed_collection.dart';
import 'package:freezed_collection_example/assistant.dart' show Assistant;
import 'package:freezed_collection_example/company.dart' show Company;
import 'package:freezed_collection_example/director.dart' show Director;
import 'package:test/expect.dart' show equals, isNot;
import 'package:test/scaffolding.dart';
import 'package:test/test.dart' show expect;

void printT<T>(T company) => print(json.encode(company));

void main() {
  group('Example', () {
    test('Basic', () {
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

      expect(company, equals(restoredCompany), reason: 'Is 1 equal to 2?');
      expect(restoredCompany, isNot(equals(newCompany)), reason: 'Is 2 equal to 3?');
      expect(newCompany, isNot(equals(newCompany2)), reason: 'Is 3 equal to 4?');
    });
  });
}
