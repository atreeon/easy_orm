import 'package:postgres/postgres.dart';
import 'package:easy_orm_engine/IService.dart';

///run the query, get the sql and return the results
dynamic runQuery(IService service, PostgreSQLConnection connection) async {
  try {
    await connection.open();
    var sql = service.getSql();

    var dbResult = await connection.mappedResultsQuery(sql);
    var typedResult = dbResult.map((e) => service.getRow(e)).toList();

    return typedResult;
  } finally {
    connection.close();
  }
}
