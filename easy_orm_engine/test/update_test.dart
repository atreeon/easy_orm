import 'package:easy_orm_engine/clauseObjects/Update.dart';
import 'package:easy_orm_engine/service/getUpdate.dart';
import 'package:test/test.dart';

import 'generated/EmployeesDefinition.dart';

void main() {
  group('update', () {
    test('a1 update custom', () {
      var actual = UpdateClauseCalculator().getUpdate(
        (EmployeesDefinition e) => UpdateCustom<EmployeesDefinition>(
          {
            e.title_of_courtesy: "Mrs.",
            e.last_name: "Flowerpot",
          },
        ),
        EmployeesDefinition(),
      );

      var expectedSql = 'update employees set title_of_courtesy = @update0, last_name = @update1';
      expect(actual.sql, expectedSql);

      var expectedSubValues = {
        "update0": "Mrs.",
        "update1": "Flowerpot",
      };
      expect(actual.substitutionValues, expectedSubValues);
    });
  });
}
