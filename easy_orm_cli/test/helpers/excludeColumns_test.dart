import 'package:easy_orm_cli/helpers/Column.dart';
import 'package:easy_orm_cli/helpers/Table.dart';
import 'package:easy_orm_cli/helpers/excludeColumns.dart';
import 'package:test/test.dart';

void main() {
  group("excludeColumns", () {
    test("0 ", () {
      var tables = [
        Table("customer_demographics", [
          Column(dbType: "bpchar", columnName: "customer_type_id", nullable: false, isIdentity: true),
        ]),
        Table("us_states", [
          Column(dbType: "varchar", columnName: "state_name", nullable: true, isIdentity: false),
          Column(dbType: "int", columnName: "us_states_id", nullable: false, isIdentity: false),
        ])
      ];

      var excludedList = {
        "customer_demographics": null,
        "us_states": ["state_name"],
      };

      var result = excludeColumns(tables, excludedList);

      var expected = [
        Table("customer_demographics", [
          Column(dbType: "bpchar", columnName: "customer_type_id", nullable: false, isIdentity: true),
        ]),
        Table("us_states", [
          Column(dbType: "int", columnName: "us_states_id", nullable: false, isIdentity: false),
        ])
      ];

      expect(result.toString(), expected.toString());
    });
  });
}
