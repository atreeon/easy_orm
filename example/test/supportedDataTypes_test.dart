import 'package:easy_orm_postgres/dbConnection/getPostgresConnectionFromConfig.dart';
import 'package:easy_orm_postgres/service/EasyOrm.dart';
import 'package:easy_orm_postgres/service/SqlResponse.dart';
import 'package:example/generatedDb/definitions/Supported_data_typesDefinition.dart';
import 'package:example/generatedDb/models/Supported_data_type.dart';
import 'package:test/test.dart';

void main() {
  group("check supported data types are inserted, selected and read correctly", () {
    tearDown(() async {
      var connection = await getPostgresConnectionFromConfig();
      await connection.open();
      var deleteAll = "DELETE FROM supported_data_types;";
      await connection.query(deleteAll);
      var resetIdentity2 = "SELECT setval(pg_get_serial_sequence('supported_data_types', 'serial2_col'), max(serial2_col)) FROM supported_data_types;";
      await connection.query(resetIdentity2);
      var resetIdentity4 = "SELECT setval(pg_get_serial_sequence('supported_data_types', 'serial4_col'), max(serial4_col)) FROM supported_data_types;";
      await connection.query(resetIdentity4);
      var resetIdentity8 = "SELECT setval(pg_get_serial_sequence('supported_data_types', 'serial8_col'), max(serial8_col)) FROM supported_data_types;";
      await connection.query(resetIdentity8);
      await connection.close();
    });
    test("1a datetime - time is lost (expected), float4 precision problems", () async {
      var supportedDataType = Supported_data_type(
        int2_col: 32767,
        int4_col: 2147483647,
        int8_col: double.maxFinite.toInt(),
        bigint_col: double.maxFinite.toInt(),
        numeric_col: 2.147483648,
        float4_col: 21474.83648,
        float8_col: double.maxFinite,
        serial2_col: 1,
        serial4_col: 2,
        serial8_col: 3,
        bool_col: true,
        char_col: "x",
        varchar_col: "a rather long string - varchar",
        text_col: "a rather long string - text",
        date_col: DateTime(2003, 12, 4, 4, 30),
      );
      var expected = supportedDataType.copyWith(
        date_col: DateTime.utc(2003, 12, 4),
        float4_col: 21474.8359375,
      );

      var responseInsert = await EasyOrm<Supported_data_type, Supported_data_typesDefinition>(
        Supported_data_typesDefinition(),
      ).insertRecords([supportedDataType]);

      var resultInsert = (responseInsert as SqlResponse_Success<List<Supported_data_type>>).result;
      expect(resultInsert.first, expected);

      //now select the data
      var responseSelect = await EasyOrm<Supported_data_type, Supported_data_typesDefinition>(Supported_data_typesDefinition()) //
          .selectQuery();
      var resultSelect = (responseSelect as SqlResponse_Success<List<Supported_data_type>>).result;
      expect(resultSelect.first, expected);
    });
  });
}
