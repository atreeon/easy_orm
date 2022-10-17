// ///run the query, get the sql and return the results
// dynamic runQuery(IService service, PostgreSQLConnection connection) async {
//   try {
//     await connection.open();
//     var sqlRequest = service.getSelectRequest();
//
//     var dbResult = await connection.mappedResultsQuery(
//       sqlRequest.sql,
//       substitutionValues: sqlRequest.substitutionValues,
//     );
//     var typedResult = dbResult.map((e) => service.getRow(e)).toList();
//
//     return typedResult;
//   } finally {
//     connection.close();
//   }
// }
