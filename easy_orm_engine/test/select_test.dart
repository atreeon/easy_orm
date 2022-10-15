import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

import 'freezedTest/EmployeeFreezed.dart';
import 'generated/EmployeeDefinition.dart';
import 'generated/EmployeeService.dart';

void main() {
  group('select', () {
    test('a0 select all columns (return type)', () {
      var query = EmployeeService(
        select: ((e) => SelectDefault<EmployeeDefinition>()),
      );

      var actual = query.getSelect();
      var expected = 'select * ';
      expect(actual, expected);

      var data = {
        "employees": {
          "employee_id": 1,
          "title_of_courtesy": "Mr.",
        },
      };

      var expected2 = EmployeeF(employee_id: 1, title_of_courtesy: "Mr.");
      var actual2 = query.getRow(data);

      expect(actual2.toString(), expected2.toString());
    });

    test('a1 select custom (single value)', () {
      var query = EmployeeService(
        select: ((e) => SelectCustom2(
              [
                e.title_of_courtesy,
              ],
            )),
      );

      var actual = query.getSelect();
      var expected = 'select title_of_courtesy';
      expect(actual, expected);

      var input = {
        "employees": {
          "employee_id": 1,
        },
      };

      var expected2 = 1;
      var actual2 = query.getRow(input);

      expect(actual2.toString(), expected2.toString());
    });

    test('a2 select custom (tuple)', () {
      var query = EmployeeService(
        select: ((e) => SelectCustom2<EmployeeDefinition>(
              [
                e.title_of_courtesy,
                e.employee_id,
              ],
            )),
      );

      var data = {
        "employees": {
          "title_of_courtesy": "Mr.",
          "employee_id": 1,
        },
      };

      var expected2 = Tuple2("Mr.", 1);
      var actual2 = query.getRow(data);

      expect(actual2.toString(), expected2.toString());
    });
  });
}

class Employee_IdOnly {
  final int employee_id;

  Employee_IdOnly(this.employee_id);
}
