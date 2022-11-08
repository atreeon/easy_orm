import 'dart:io';

import 'package:easy_orm_postgres/dbConnection/DbConnectionValues.dart';
import 'package:yaml/yaml.dart';

///If an environment variable is found we look up the db connection values from that file.
///If none is found we default to local_test_db
///ciserver_test_db - for the continuous integration server
///local_test_db - use to test locally
Future<DbConnectionValues> getDbConnectionValuesFromConfig() async {
  var env = Platform.environment;
  var test_db_config = env["TEST_DB_CONFIG"];

  test_db_config ??= "local_test_db.yaml";

  final yaml = await File("config/$test_db_config").readAsString();
  final yamlData = loadYaml(yaml);

  return DbConnectionValues(
    username: yamlData["username"],
    password: yamlData["password"],
    db: yamlData["db"],
    port: yamlData["port"],
    host: yamlData["host"],
  );
}
