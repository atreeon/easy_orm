@Tags(['integration'])

import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';
import 'package:easy_orm_engine/dbConnection/getPostgresConnectionFromConfig.dart';
import 'package:easy_orm_engine/runQuery.dart';
import 'package:test/test.dart';

import 'freezedTest/EmployeeFreezed.dart';
import 'generated/EmployeeService.dart';

void main() {
  group('getData', () {
    test('a1', () async {
      var service = EmployeeService(
        where: ((e) => Where(e.employee_id.lt(4))),
        orderBy: ((e) => OrderBy([OrderByItem(e.title_of_courtesy)])),
      );

      var connection = await getPostgresConnectionFromConfig();
      var data = await runQuery(service, connection);

      var expected = [
        EmployeeF(employee_id: 2, title_of_courtesy: "Dr."),
        EmployeeF(employee_id: 1, title_of_courtesy: "Ms."),
        EmployeeF(employee_id: 3, title_of_courtesy: "Ms."),
      ];

      expect(data.toString(), expected.toString());
    });
  });
}
