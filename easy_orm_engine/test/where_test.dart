import 'package:easy_orm_engine/clauseObjects/Where.dart';
import 'package:easy_orm_engine/service/getWhere.dart';
import 'package:test/test.dart';

import 'generated/EmployeesDefinition.dart';

void main() {
  group('where', () {
    test('a0 filter by one clause', () {
      var actual = getWhere(
        (EmployeesDefinition e) => Where(
          e.employee_id.gt(2),
        ),
        EmployeesDefinition(),
      );

      var expectedSql = 'where employee_id > @where0';
      var expectedSubstitution = {"where0": 2};
      expect(actual.sql, expectedSql);
      expect(actual.substitutionValues, expectedSubstitution);
    });

    test('a1 two and statements', () {
      var actual = getWhere(
        (EmployeesDefinition e) => Where(
          Brackets(
            e.employee_id.eq(3),
            Or(e.employee_id.eq(5)),
            Or(e.employee_id.eq(7)),
          ),
          And(e.employee_id.gt(4)),
        ),
        EmployeesDefinition(),
      );

      var expectedSql = 'where ((employee_id = @where0 or employee_id = @where1 or employee_id = @where2) and employee_id > @where3)';

      var expectedSubstitution = {
        "where0": 3,
        "where1": 5,
        "where2": 7,
        "where3": 4,
      };
      expect(actual.sql, expectedSql);
      expect(actual.substitutionValues, expectedSubstitution);
    });

    test('a2 sub or clause', () {
      var actual = getWhere(
        (EmployeesDefinition e) => Where(
          Brackets(
            e.employee_id.gt(5),
            Or(e.employee_id.lt(4)),
          ),
          And(e.title_of_courtesy.like("Dr."), Or(e.title_of_courtesy.like("Mr."))),
        ),
        EmployeesDefinition(),
      );

      var expectedSql = "where ((employee_id > @where0 or employee_id < @where1) and (title_of_courtesy like @where2 or title_of_courtesy like @where3))";
      var expectedSubstitution = {
        "where0": 5,
        "where1": 4,
        "where2": "Dr.",
        "where3": "Mr.",
      };
      expect(actual.sql, expectedSql);
      expect(actual.substitutionValues, expectedSubstitution);
    });

    //todo: joins
    // test('a3 inner joins', () {
    //   var actual = getWhere2(
    //     (EmployeesDefinition e, TerritoriesDefinition t) => Where(
    //       Brackets(
    //         e.employee_id.gt(5),
    //         Or(e.employee_id.lt(4)),
    //         Or(t.region_id.gt(3)),
    //       ),
    //       And(
    //         e.title_of_courtesy.like("Dr."),
    //         Or(e.title_of_courtesy.like("Mr.")),
    //       ),
    //     ),
    //     EmployeesDefinition(),
    //     TerritoriesDefinition(),
    //   );
    //
    //   var expectedSql = "where ((a.employee_id > @where0 or a.employee_id < @where1 or b.region_id > 3) and (a.title_of_courtesy like @where2 or a.title_of_courtesy like @where3))";
    //   var expectedSubstitution = {
    //     "where0": 5,
    //     "where1": 4,
    //     "where2": 3,
    //     "where3": "Dr.",
    //     "where4": "Mr.",
    //   };
    //   expect(actual.sql, expectedSql);
    //   expect(actual.substitutionValues, expectedSubstitution);
    // });
  });
}
