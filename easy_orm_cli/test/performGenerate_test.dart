@Tags(['integration'])

import 'package:easy_orm_engine/dbConnection/getPostgresConnectionFromConfig.dart';
import 'package:postgrest_cli/generator.dart';
import 'package:test/test.dart';

import 'expectedResults/expectedFiles.dart';

void main() {
  group("performGenerate", () {
    test('a1 performGenerate', () async {
      var cn = await getPostgresConnectionFromConfig();
      var result = await performGenerate(
        postgresConnection: cn,
        writeFiles: false, //don't write the results
        packageName: "example",
      );
      var definition = result[27]; //us_states
      var service = result[13]; //us_states

      expect(result.length, 42);
      expect(definition.trim(), expectedDefinition.trim());
      expect(service.trim(), expectedService.trim());
    });
  });
}
