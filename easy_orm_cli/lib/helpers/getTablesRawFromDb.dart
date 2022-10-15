import 'package:postgres/postgres.dart';

///go to the db and return the list of tables with column details
Future<List<Map<String, Map<String, dynamic>>>> getTablesRawFromDb(
  PostgreSQLConnection connection,
  String table_schema,
) async {
  try {
    await connection.open();
    var dbResult = await connection.mappedResultsQuery(
      """
select table_name, udt_name, column_name, is_nullable, is_identity, * 
from "information_schema"."columns" 
where table_schema = @table_schema
order by table_name, is_identity desc, is_nullable, udt_name, column_name
""",
      substitutionValues: {"table_schema": table_schema},
    );

    return dbResult;
  } finally {
    connection.close();
  }
}
