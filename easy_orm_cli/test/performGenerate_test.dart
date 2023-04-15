@Tags(['integration'])
import 'package:easy_orm_cli/generator.dart';
import 'package:easy_orm_cli/helpers/generator_options.dart';
import 'package:easy_orm_postgres/dbConnection/getDbConnectionValuesFromConfig.dart';
import 'package:test/test.dart';

import 'helpers/convertTables_expectedResults/expectedDb.dart';
import 'helpers/convertTables_expectedResults/expectedDefinition.dart';
import 'helpers/convertTables_expectedResults/expectedModel.dart';

void main() {
  Future<List<String>> _performGenerate() async {
    var cn = await getDbConnectionValuesFromConfig();
    var result = await performGenerate(
      GeneratorOptions(
        host: cn.host,
        port: cn.port,
        db: cn.db,
        username: cn.username,
        password: cn.password,
        package: 'example',
      ),
      writeFiles: false, //don't write the results
    );
    return result;
  }

  group("performGenerate", () {
    test('a0 correct number of files output', () async {
      var result = await _performGenerate();
      expect(result.length, 31);
    });

    test('a1 performGenerate writes definition correctly', () async {
      var result = await _performGenerate();
      var definition = result[14]; //Us_statesDefinition
      expect(definition.trim(), expectedDefinition.trim());
    });

    test('a2 performGenerate writes model correctly', () async {
      var result = await _performGenerate();
      var model = result[29]; //us_state
      expect(model.trim(), expectedModel.trim());
    });

    test('a3 performGenerate writes db correctly', () async {
      var result = await _performGenerate();
      var db = result[30]; //db
      expect(db.trim(), expectedDb.trim());
    });
  });
}
