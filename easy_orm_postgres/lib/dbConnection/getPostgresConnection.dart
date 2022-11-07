import 'package:args/args.dart';
import 'package:postgres/postgres.dart';

Future<PostgreSQLConnection> getPostgresConnection(ArgResults argResults) async {
  var port = int.tryParse(argResults.command!['port']);
  if (port == null) //
    throw Exception("port needs to be an integer");

  var connection = PostgreSQLConnection(
    argResults.command!['host'],
    port,
    argResults.command!['db'],
    username: argResults.command!['username'],
    password: argResults.command!['password'],
  );

  return connection;
}
