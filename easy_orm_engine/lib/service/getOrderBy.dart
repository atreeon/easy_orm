import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:easy_orm_engine/SqlRequest.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';

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
