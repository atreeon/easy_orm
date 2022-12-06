import 'package:easy_orm_postgres/service/getTypeFromDbRow.dart';
import 'package:test/test.dart';

import '../generated/Supported_data_typesDefinition.dart';

void main() {
  group('select', () {
    test('a0 select all columns (return type)', () {
      var row = {
        "supported_data_types": {
          "int2_col": 32767,
          "int4_col": 2147483647,
          "int8_col": double.maxFinite.toInt(),
          "bigint_col": double.maxFinite.toInt(),
          "numeric_col": "2.147483648",
          "float4_col": 2.147483648,
          "float8_col": double.maxFinite,
          "serial2_col": 1,
          "serial4_col": 2,
          "serial8_col": 3,
          "bool_col": true,
          "char_col": "x",
          "varchar_col": "a rather long string - varchar",
          "text_col": "a rather long string - text",
          "date_col": DateTime(2003, 12, 4, 4, 30),
        }
      };

      var result = getTypeFromDbRow("supported_data_types", Supported_data_typesDefinition().numeric_col, row);
      expect(result, 2.147483648);
    });
  });
}
