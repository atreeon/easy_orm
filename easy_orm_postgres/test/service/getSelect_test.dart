import 'package:easy_orm_postgres/service/getSelect.dart';
import 'package:test/test.dart';

import '../generated/EmployeesDefinition.dart';
import '../generated/TerritoriesDefinition.dart';

void main() {
  group('select', () {
    test('a0 select all columns (return type)', () {
      var actual = getSelect(TerritoriesDefinition());

      var expected = 'select * ';
      expect(actual.sql, expected);
    });

    test('a1 select custom (single value)', () {
      var actual = getSelect<EmployeesDefinition>(
        EmployeesDefinition(),
        (e) => e.title_of_courtesy,
      );

      var expected = 'select title_of_courtesy';
      expect(actual.sql, expected);
    });

    test('a2 select custom (tuple)', () {
      var actual = getSelect<EmployeesDefinition>(
        EmployeesDefinition(),
        (e) => e.title_of_courtesy,
        (e) => e.employee_id,
      );

      var expected = 'select title_of_courtesy, employee_id';
      expect(actual.sql, expected);
    });
  });
}
