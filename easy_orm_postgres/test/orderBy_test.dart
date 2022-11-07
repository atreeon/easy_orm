import 'package:easy_orm_postgres/clauseObjects/OrderBy.dart';
import 'package:easy_orm_postgres/service/getOrderBy.dart';
import 'package:test/test.dart';

import 'generated/EmployeesDefinition.dart';

void main() {
  group('orderBy', () {
    test('a0 select all columns', () {
      var actual = getOrderBy(null, EmployeesDefinition());
      var expected = '';
      expect(actual.sql, expected);
    });

    test('a1 one orderby desc', () {
      var actual = getOrderBy(
        (EmployeesDefinition e) => OrderBy(
          [
            OrderByItem(e.employee_id, isAscending: false),
          ],
        ),
        EmployeesDefinition(),
      );

      var expected = 'order by employee_id DESC';
      expect(actual.sql, expected);
    });

    test('a2 one orderby desc', () {
      var actual = getOrderBy(
        (EmployeesDefinition e) => OrderBy(
          [
            OrderByItem(e.employee_id, isAscending: true),
            OrderByItem(e.title_of_courtesy),
          ],
        ),
        EmployeesDefinition(),
      );

      var expected = 'order by employee_id ASC, title_of_courtesy ASC';
      expect(actual.sql, expected);
    });
  });
}
