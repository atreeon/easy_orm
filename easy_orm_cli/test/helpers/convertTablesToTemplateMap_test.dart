import 'package:easy_orm_cli/helpers/Column.dart';
import 'package:easy_orm_cli/helpers/Table.dart';
import 'package:easy_orm_cli/helpers/convertTablesToTemplateMap.dart';
import 'package:easy_orm_cli/helpers/generator_options.dart';
import 'package:test/test.dart';

main() {
  group("convertTablesToTemplateMap", () {
    test('d1', () async {
      var tablesInput = [
        Table("employees", <Column>[
          Column(
              dbType: "int4",
              columnName: "employee_id",
              nullable: false,
              isIdentity: false),
          Column(
              dbType: "text",
              columnName: "full_name",
              nullable: true,
              isIdentity: false),
        ]),
        Table("users", <Column>[
          Column(
              dbType: "int4",
              columnName: "user_id",
              nullable: false,
              isIdentity: true),
          Column(
              dbType: "text",
              columnName: "username",
              nullable: true,
              isIdentity: false),
        ]),
      ];

      var expected = {
        "employeesDefinition.dart": {
          'packageName': 'example',
          "definitionName": "EmployeesDefinition",
          "tableName": "employees",
          "columns": [
            {
              "dbType": "int4",
              "dartType": "int",
              "columnName": "employee_id",
              "nullable": "false",
              "tableName": "employees",
              "columnType": "Numeric",
              "modelName": "Employee",
              "isIdentity": "false"
            },
            {
              "dbType": "text",
              "dartType": "String?",
              "columnName": "full_name",
              "nullable": "true",
              "tableName": "employees",
              "columnType": "NullableChar",
              "modelName": "Employee",
              "isIdentity": "false"
            },
          ],
          "modelName": "Employee",
          "propertySetColumns": [
            {
              "columnName": "employee_id",
            },
            {
              "columnName": "full_name",
            },
          ],
          "columnNamesDelimited": "employee_id,full_name",
        },
        "usersDefinition.dart": {
          'packageName': 'example',
          "definitionName": "UsersDefinition",
          "tableName": "users",
          "columns": [
            {
              "dbType": "int4",
              "dartType": "int",
              "columnName": "user_id",
              "nullable": "false",
              "tableName": "users",
              "columnType": "Numeric",
              "modelName": "User",
              "isIdentity": "true"
            },
            {
              "dbType": "text",
              "dartType": "String?",
              "columnName": "username",
              "nullable": "true",
              "tableName": "users",
              "columnType": "NullableChar",
              "modelName": "User",
              "isIdentity": "false"
            },
          ],
          "modelName": "User",
          "propertySetColumns": [
            {
              "columnName": "user_id",
            },
            {
              "columnName": "username",
            },
          ],
          "columnNamesDelimited": "user_id,username",
        }
      };

      var actual = convertTablesToTemplateMap(
          tablesInput,
          GeneratorOptions.empty.copyWith(package: "example"),
          (x) => x.tableName + "Definition.dart");

      expect(actual, expected);
    });
  });
}
