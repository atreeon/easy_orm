@Tags(['integration'])
import 'package:easy_orm_cli/generator.dart';
import 'package:easy_orm_postgres/dbConnection/getPostgresConnectionFromConfig.dart';
import 'package:test/test.dart';

import 'helpers/convert_expectedResults/expectedDb.dart';
import 'helpers/convert_expectedResults/expectedDefinition.dart';
import 'helpers/convert_expectedResults/expectedModel.dart';

void main() {
  Future<List<String>> _performGenerate() async {
    var cn = await getPostgresConnectionFromConfig();
    var result = await performGenerate(
      postgresConnection: cn,
      writeFiles: false, //don't write the results
      packageName: "example",
    );
    return result;
  }

  group("performGenerate", () {
    test('a0 correct number of files output', () async {
      var result = await _performGenerate();
      expect(result.length, 33);
    });

    test('a1 performGenerate writes definition correctly', () async {
      var result = await _performGenerate();
      var definition = result[15]; //Us_statesDefinition
      expect(definition.trim(), expectedDefinition.trim());
    });

    test('a2 performGenerate writes model correctly', () async {
      var result = await _performGenerate();
      var model = result[31]; //us_state
      expect(model.trim(), expectedModel.trim());
    });

    test('a3 performGenerate writes db correctly', () async {
      var result = await _performGenerate();
      var db = result[32]; //db
      expect(db.trim(), expectedDb.trim());
    });
  });
}
