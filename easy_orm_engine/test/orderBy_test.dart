import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:test/test.dart';

import 'generated/EmployeeService.dart';

void main() {
  group('orderBy', () {
    test('a0 select all columns', () {
      var query = EmployeeService();

      var actual = query.getOrderBy();
      var expected = '';
      expect(actual, expected);
    });

    test('a1 one orderby desc', () {
      var query = EmployeeService(
        orderBy: ((e) => OrderBy([
              OrderByItem(e.employee_id, isAscending: false),
            ])),
      );

      var actual = query.getOrderBy();
      var expected = 'order by employee_id DESC';
      expect(actual, expected);
    });

    test('a2 one orderby desc', () {
      var query = EmployeeService(
        orderBy: ((e) => OrderBy([
              OrderByItem(e.employee_id, isAscending: true),
              OrderByItem(e.title_of_courtesy),
            ])),
      );

      var actual = query.getOrderBy();
      var expected = 'order by employee_id ASC, title_of_courtesy ASC';
      expect(actual, expected);
    });
  });
}
