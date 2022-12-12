import 'package:easy_orm_cli/helpers/Column.dart';
import 'package:easy_orm_cli/helpers/Table.dart';
import 'package:easy_orm_cli/helpers/excludeUnsupportedColumns.dart';
import 'package:test/test.dart';

void main() {
  group("excludeColumns", () {
    test("0 filters out bpchar (unsupported)", () {
      var tables = [
        Table("customer_demographics", [
          Column(dbType: "varchar", columnName: "customer_type_id", nullable: false, isIdentity: true),
        ]),
        Table("us_states", [
          Column(dbType: "line", columnName: "the_line", nullable: true, isIdentity: false),
          Column(dbType: "int4", columnName: "us_states_id", nullable: false, isIdentity: false),
        ])
      ];

      var result = excludeUnsupported(tables);

      var expected = [
        Table("customer_demographics", [
          Column(dbType: "varchar", columnName: "customer_type_id", nullable: false, isIdentity: true),
        ]),
        Table("us_states", [
          Column(dbType: "int4", columnName: "us_states_id", nullable: false, isIdentity: false),
        ])
      ];

      expect(result.toString(), expected.toString());
    });
  });
}
