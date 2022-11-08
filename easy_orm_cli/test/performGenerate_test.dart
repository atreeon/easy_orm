@Tags(['integration'])

import 'package:easy_orm_postgres/dbConnection/getPostgresConnectionFromConfig.dart';
import 'package:easy_orm_cli/generator.dart';
import 'package:test/test.dart';

import 'expectedResults/expectedFiles.dart';

void main() {
  group("performGenerate", () {
    test('a2 performGenerate', () async {
      var cn = await getPostgresConnectionFromConfig();
      var result = await performGenerate(
        postgresConnection: cn,
        writeFiles: false, //don't write the results
        packageName: "example",
      );
      var definition = result[13]; //us_states

      expect(result.length, 28);
      expect(definition.trim(), expectedDefinition.trim());
    });

    //We no longer create a service file
    // test('a1 performGenerate', () async {
    //   var cn = await getPostgresConnectionFromConfig();
    //   var result = await performGenerate(
    //     postgresConnection: cn,
    //     writeFiles: false, //don't write the results
    //     packageName: "example",
    //   );
    //   var service = result[13]; //us_states
    //
    //   expect(result.length, 28);
    //   expect(service.trim(), expectedService.trim());
    // });
  });
}
