import 'package:easy_orm_cli/helpers/Column.dart';
import 'package:easy_orm_cli/helpers/Table.dart';
import 'package:easy_orm_cli/helpers/convertTablesToDbMap.dart';
import 'package:test/test.dart';

main() {
  group("convertTablesToDbMap", () {
    test('d1', () async {
      var tablesInput = [
        Table("employees", <Column>[
          Column(dbType: "int4", columnName: "employee_id", nullable: false, isIdentity: false),
          Column(dbType: "text", columnName: "full_name", nullable: true, isIdentity: false),
        ]),
        Table("users", <Column>[
          Column(dbType: "int4", columnName: "user_id", nullable: false, isIdentity: true),
          Column(dbType: "text", columnName: "username", nullable: true, isIdentity: false),
        ]),
      ];

      var expected = {
        "Db.dart": {
          "tables": [
            {
              "modelName": "Employee",
              "definitionName": "EmployeesDefinition",
              "variableName": "employees",
            },
            {
              "modelName": "User",
              "definitionName": "UsersDefinition",
              "variableName": "users",
            },
          ],
          "models": [
            {
              "filename": "Employee",
              "directory": "models",
              "packageName": "example",
            },
            {
              "filename": "User",
              "directory": "models",
              "packageName": "example",
            },
          ],
          "definitions": [
            {
              "filename": "EmployeesDefinition",
              "directory": "definitions",
              "packageName": "example",
            },
            {
              "filename": "UsersDefinition",
              "directory": "definitions",
              "packageName": "example",
            },
          ],
        },
      };

      var actual = convertTablesToDbMap(tablesInput, "example");

      expect(actual, expected);
    });
  });
}
