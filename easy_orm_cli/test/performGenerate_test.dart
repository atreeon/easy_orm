@Tags(['integration'])
import 'package:easy_orm_cli/generator.dart';
import 'package:easy_orm_postgres/dbConnection/getPostgresConnectionFromConfig.dart';
import 'package:test/test.dart';

import 'expectedResults/expectedFiles.dart';

void main() {
  group("performGenerate", () {
    test('a2 performGenerate writes correctly', () async {
      var cn = await getPostgresConnectionFromConfig();
      var result = await performGenerate(
        postgresConnection: cn,
        writeFiles: false, //don't write the results
        packageName: "example",
      );
      var definition = result[15]; //us_states

      expect(definition.trim(), expectedDefinition.trim());
    });
  });
}
