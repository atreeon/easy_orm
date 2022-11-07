import 'package:postgres/postgres.dart';
import 'package:easy_orm_postgres/dbConnection/getDbConnectionValuesFromConfig.dart';

Future<PostgreSQLConnection> getPostgresConnectionFromConfig() async {
  var cnValues = await getDbConnectionValuesFromConfig();

  var connection = PostgreSQLConnection(
    cnValues.host,
    cnValues.port,
    cnValues.db,
    username: cnValues.username,
    password: cnValues.password,
  );

  return connection;
}
