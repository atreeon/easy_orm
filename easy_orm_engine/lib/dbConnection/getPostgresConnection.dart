import 'package:postgres/postgres.dart';

Future<PostgreSQLConnection> getPostgresConnection({
  required String host,
  required int port,
  required String db,
  required String username,
  required String password,
}) async {
  var connection = PostgreSQLConnection(
    host,
    port,
    db,
    username: username,
    password: password,
  );

  return connection;
}
