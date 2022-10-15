import 'package:easy_orm_engine/clauseObjects/Where.dart';
import 'package:test/test.dart';

import 'generated/EmployeeService.dart';

void main() {
  group('where', () {
    test('a0 filter by one clause', () {
      var query = EmployeeService(
        where: ((e) => Where(
              e.employee_id.gt(2),
            )),
      );

      var actual = query.getWhere();
      var expected = 'where employee_id > 2';
      expect(actual, expected);
    });

    test('a1 two and statements', () {
      var query = EmployeeService(
        where: ((e) => Where(
              Brackets(
                e.employee_id.eq(3),
                Or(e.employee_id.eq(5)),
                Or(e.employee_id.eq(7)),
              ),
              And(e.employee_id.gt(4)),
            )),
      );

      var actual = query.getWhere();
      var expected = 'where ((employee_id = 3 or employee_id = 5 or employee_id = 7) and employee_id > 4)';
      expect(actual, expected);
    });

    test('a2 sub or clause', () {
      var query = EmployeeService(
          where: ((e) => Where(
                Brackets(
                  e.employee_id.gt(5),
                  Or(e.employee_id.lt(4)),
                ),
                And(e.title_of_courtesy.like("Dr."), Or(e.title_of_courtesy.like("Mr."))),
              )));

      var actual = query.getWhere();
      var expected = "where ((employee_id > 5 or employee_id < 4) and (title_of_courtesy like 'Dr.' or title_of_courtesy like 'Mr.'))";
      expect(actual, expected);
    });
  });
}

class Table {}
