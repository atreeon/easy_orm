import 'package:easy_orm_postgres/ITableDefinition.dart';
import 'package:easy_orm_postgres/SqlRequest.dart';
import 'package:easy_orm_postgres/clauseObjects/OrderBy.dart';

SqlRequest getOrderBy<TDef extends ITableDefinition>(OrderBy Function(TDef e)? orderBy, TDef tableDefinition) {
  late OrderBy orderByObj;

  if (orderBy == null) //
    return SqlRequest('', {});

  orderByObj = orderBy(tableDefinition);

  var sql = 'order by ' +
      orderByObj.columns //
          .map((e) => "${e.column.name} ${e.isAscending ? 'ASC' : 'DESC'}")
          .join(", ");

  return SqlRequest(sql, {});

}
