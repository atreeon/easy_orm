import 'package:easy_orm_postgres/dbConnection/getPostgresConnectionFromConfig.dart';
import 'package:easy_orm_postgres/service/EasyOrm.dart';
import 'package:easy_orm_postgres/service/SqlResponse.dart';
import 'package:example/generatedDb/definitions/Supported_data_typesDefinition.dart';
import 'package:example/generatedDb/models/Supported_data_type.dart';
import 'package:example/generatedDb/models/Us_state.dart';
import 'package:postgres/postgres.dart';
import 'package:test/test.dart';

void main() {
  group("insert", () {
    tearDown(() async {
      //todo
      // var connection = await getPostgresConnectionFromConfig();
      // await connection.open();
      // var resetIdentity = "SELECT setval(pg_get_serial_sequence('us_states', 'state_id'), max(state_id)) FROM us_states;";
      // await connection.query(resetIdentity);
      // await connection.close();
    });

    /*todo:
    nulls
    max
    min
     */

    test("1a insert", () async {
      var connection = await getPostgresConnectionFromConfig();
      await connection.open();
      late SqlResponse<List<Supported_data_type>>? sqlResponse;

      // try {
      await connection.transaction((ctx) async {
        SqlResponse<List<Supported_data_type>> data;

        data = await EasyOrm<Supported_data_type, Supported_data_typesDefinition>(ctx, Supported_data_typesDefinition()) //
            .insertRecords(
          [
            Supported_data_type(
              int2_col: 32767,
              int4_col: 2147483647,
              int8_col: double.maxFinite.toInt(),
              bigint_col: double.maxFinite.toInt(),
              numeric_col: 2.147483648,
              float4_col: 2.147483648,
              float8_col: double.maxFinite,
              serial2_col: 1,
              serial4_col: 2,
              serial8_col: 3,
              bool_col: true,
              char_col: "x",
              varchar_col: "a rather long string - varchar",
              text_col: "a rather long string - text",
              date_col: DateTime(2003, 12, 4, 4, 30),
            ),
          ],
        );

        sqlResponse = data;

        ctx.cancelTransaction();
      });
      // } catch (e) {
      //   print('error hello');
      // }
      connection.close();

      var expected = [52, 53];
      expect(sqlResponse is SqlResponse_Success<List<Us_state>>, true);
      expect((sqlResponse as SqlResponse_Success<List<Us_state>>).result.map((x) => x.state_id), expected);
    });
  });

  // group("delete", () {
  //   tearDown(() async {
  //     var connection = await getPostgresConnectionFromConfig();
  //     await connection.open();
  //     var resetIdentity = "SELECT setval(pg_get_serial_sequence('us_states', 'state_id'), max(state_id)) FROM us_states;";
  //     await connection.query(resetIdentity);
  //     await connection.close();
  //   });
  //
  //   test("1d delete one record", () async {
  //     var connection = await getPostgresConnectionFromConfig();
  //     await connection.open();
  //     late SqlResponse<int> result;
  //     await connection.transaction((ctx) async {
  //       var data = await EasyOrm<Us_state, Us_statesDefinition>(ctx, Us_statesDefinition()) //
  //           .deleteRecords(
  //         (e) => Where(
  //           e.state_id.eq(2),
  //         ),
  //       );
  //       result = data;
  //       ctx.cancelTransaction();
  //     });
  //     connection.close();
  //
  //     var expected = 1;
  //     var resultFormatted = result as SqlResponse_Success<int>;
  //
  //     expect(resultFormatted.result, expected);
  //   });
  // });
}
