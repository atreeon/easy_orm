import 'package:easy_orm_cli/helpers/Column.dart';
import 'package:easy_orm_cli/helpers/Table.dart';
import 'package:easy_orm_cli/helpers/convertRawTablesToTables.dart';
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
            "is_identity": "YES",
          }
        },
        {
          "": {
            "table_name": "us_states",
            "udt_name": "varchar",
            "column_name": "state_name",
            "is_nullable": "YES",
            "is_identity": "NO",
          }
        },
        {
          "": {
            "table_name": "us_states",
            "udt_name": "int",
            "column_name": "us_states_id",
            "is_nullable": "NO",
            "is_identity": "NO",
          }
        },
      ];

      var expected = [
        Table("customer_demographics", [
          Column(dbType: "bpchar", columnName: "customer_type_id", nullable: false, isIdentity: true),
        ]),
        Table("us_states", [
          Column(dbType: "varchar", columnName: "state_name", nullable: true, isIdentity: false),
          Column(dbType: "int", columnName: "us_states_id", nullable: false, isIdentity: false),
        ]),
      ].toString();

      var actual = convertRawTablesToTables(input, null).toString();

      expect(actual, expected);
    });

    test('b2 exclude unsuported datatype columns', () async {
      var input = [
        {
          "": {
            "table_name": "us_states",
            "udt_name": "varchar",
            "column_name": "state_name",
            "is_nullable": "YES",
            "is_identity": "NO",
          }
        },
        {
          "": {
            "table_name": "us_states",
            "udt_name": "bytea",
            "column_name": "photo",
            "is_nullable": "YES",
            "is_identity": "NO",
          }
        },
      ];

      var expected = [
        Table("us_states", [
          Column(dbType: "varchar", columnName: "state_name", nullable: true, isIdentity: false),
        ]),
      ].toString();

      var actual = convertRawTablesToTables(input, null).toString();

      expect(actual, expected);
    });

    test('b3 exclude columns & tables', () async {
      var input = [
        {
          "": {
            "table_name": "customer_demographics",
            "udt_name": "varchar",
            "column_name": "name",
            "is_nullable": "NO",
            "is_identity": "YES",
          }
        },
        {
          "": {
            "table_name": "us_states",
            "udt_name": "varchar",
            "column_name": "state_name",
            "is_nullable": "YES",
            "is_identity": "NO",
          }
        },
        {
          "": {
            "table_name": "us_states",
            "udt_name": "int",
            "column_name": "us_states_id",
            "is_nullable": "NO",
            "is_identity": "NO",
          }
        },
      ];

      var expected = [
        Table("us_states", [
          Column(dbType: "int", columnName: "us_states_id", nullable: false, isIdentity: false),
        ]),
      ].toString();

      var excludedList = {
        "customer_demographics": null,
        "us_states": ["state_name"],
      };

      var actual = convertRawTablesToTables(input, excludedList).toString();

      expect(actual, expected);
    });
  });
}
