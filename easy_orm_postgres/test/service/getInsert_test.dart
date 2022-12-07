import 'package:easy_orm_postgres/service/getInsert.dart';
import 'package:test/test.dart';

import '../generated/Employee.dart';
import '../generated/EmployeesDefinition.dart';
import '../generated/Territorie.dart';
import '../generated/TerritoriesDefinition.dart';

void main() {
  group('insert', () {
    test('a0 generate insert statement', () {
      var data = [
        Territorie(territory_description: "desc1", region_id: 1, territory_id: "id1"),
        Territorie(territory_description: "desc2", region_id: 7, territory_id: "id2"),
        Territorie(territory_description: "desc3", region_id: 13, territory_id: "id3"),
      ];

      var actual = InsertClauseCalculator().getInsert(
        data,
        TerritoriesDefinition(),
      );

      var expectedSql = """
INSERT INTO territories(territory_description,region_id,territory_id) VALUES
(@insert0, @insert1, @insert2),
(@insert3, @insert4, @insert5),
(@insert6, @insert7, @insert8)
returning *;""";

      expect(actual.sql, expectedSql);

      var expectedSubValues = {
        "insert0": "desc1",
        "insert1": 1,
        "insert2": "id1",
        "insert3": "desc2",
        "insert4": 7,
        "insert5": "id2",
        "insert6": "desc3",
        "insert7": 13,
        "insert8": "id3",
      };
      expect(actual.substitutionValues, expectedSubValues);
    });

    test('a0 generate insert statement', () {
      var data = [
        Employee(employee_id: 0, first_name: "Bob", last_name: "Bobson", birth_date: null, hire_date: null, reports_to: null, notes: null, address: null, city: null, country: null, extension: null, home_phone: null, photo_path: null, postal_code: null, region: null, title: null, title_of_courtesy: null),
        Employee(employee_id: 0, first_name: "Julie", last_name: "Jutland", birth_date: null, hire_date: null, reports_to: null, notes: null, address: null, city: null, country: null, extension: null, home_phone: null, photo_path: null, postal_code: null, region: null, title: null, title_of_courtesy: null),
      ];

      var actual = InsertClauseCalculator().getInsert(
        data,
        EmployeesDefinition(),
      );

      var expectedSql = """
INSERT INTO employees(employee_id,first_name,last_name,birth_date,hire_date,reports_to,notes,address,city,country,extension,home_phone,photo_path,postal_code,region,title,title_of_courtesy) VALUES
(default, @insert0, @insert1, @insert2, @insert3, @insert4, @insert5, @insert6, @insert7, @insert8, @insert9, @insert10, @insert11, @insert12, @insert13, @insert14, @insert15),
(default, @insert16, @insert17, @insert18, @insert19, @insert20, @insert21, @insert22, @insert23, @insert24, @insert25, @insert26, @insert27, @insert28, @insert29, @insert30, @insert31)
returning *;""";

      expect(actual.sql, expectedSql);

      var expectedSubValues = {
        'insert0': 'Bob',
        'insert1': 'Bobson',
        'insert2': null,
        'insert3': null,
        'insert4': null,
        'insert5': null,
        'insert6': null,
        'insert7': null,
        'insert8': null,
        'insert9': null,
        'insert10': null,
        'insert11': null,
        'insert12': null,
        'insert13': null,
        'insert14': null,
        'insert15': null,
        'insert16': 'Julie',
        'insert17': 'Jutland',
        'insert18': null,
        'insert19': null,
        'insert20': null,
        'insert21': null,
        'insert22': null,
        'insert23': null,
        'insert24': null,
        'insert25': null,
        'insert26': null,
        'insert27': null,
        'insert28': null,
        'insert29': null,
        'insert30': null,
        'insert31': null,
      };
      expect(actual.substitutionValues, expectedSubValues);
    });
  });
}
