import 'package:postgrest_cli/helpers/Column.dart';
import 'package:postgrest_cli/helpers/Table.dart';
import 'package:postgrest_cli/helpers/convertRawTablesToTables.dart';
import 'package:test/test.dart';


void main() {
  group("rawTablesToTables", () {
    test('b1', () async {
      var input = [
        {
          "": {
            "table_name": "customer_demographics",
            "udt_name": "bpchar",
            "column_name": "customer_type_id",
            "is_nullable": "NO",
          }
        },
        {
          "": {
            "table_name": "us_states",
            "udt_name": "varchar",
            "column_name": "state_name",
            "is_nullable": "YES",
          }
        },
        {
          "": {
            "table_name": "us_states",
            "udt_name": "int",
            "column_name": "us_states_id",
            "is_nullable": "NO",
          }
        },
      ];

      var expected = [
        Table("customer_demographics", [
          Column(dbType: "bpchar", columnName: "customer_type_id", nullable: false),
        ]),
        Table("us_states", [
          Column(dbType: "varchar", columnName: "state_name", nullable: true),
          Column(dbType: "int", columnName: "us_states_id", nullable: false),
        ]),
      ].toString();

      var actual = convertRawTablesToTables(input).toString();

      expect(actual, expected);
    });
  });
}
