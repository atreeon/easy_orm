import 'package:easy_orm_postgres/ITableDefinition.dart';
import 'package:easy_orm_postgres/SqlRequest.dart';
import 'package:easy_orm_postgres/clauseObjects/Where.dart';
import 'package:easy_orm_postgres/helpers/helpers.dart';

///'where' clause
SqlRequest getWhere2<TDef1 extends ITableDefinition, TDef2 extends ITableDefinition>(
  Where Function(TDef1 e, TDef2 t2)? where,
  TDef1 tableDefinition1,
  TDef2 tableDefinition2,
) {
  return SqlRequest('sql', {});
}

///'where' clause
SqlRequest getWhere<TDef extends ITableDefinition>(
  Where Function(TDef e)? where,
  TDef tableDefinition,
) {
  if (where != null) {
    var whereObj = where(tableDefinition);
    var whereClauseCalculator = WhereClauseCalculator();
    return whereClauseCalculator //
        .getWhereFromCommand(whereObj)
        .prependSql("where ");
  } else {
    return SqlRequest("", {});
  }
}

/*
how do I get the next substitution value id?
previously it was state, now I'm passing the value around
 */

class WhereClauseCalculator {
  int substitutionValue = 0;

  int getNextSubstitutionValue() {
    var value = substitutionValue;
    this.substitutionValue++;
    return value;
  }

  ///generate 'where' clause
  SqlRequest getWhereFromCommand(
    ClauseSuper clause, {
    SqlRequest sqlRequest = const SqlRequest("", {}),
    bool isSubCmd = false,
  }) {
    if (clause.sql != null) {
      sqlRequest = sqlRequest.appendSql(" ${clause.sql} ");
    }

    var cmds = <Command>[];
    cmds.addIfNotNull(clause.cmd1);
    cmds.addIfNotNull(clause.cmd2);
    cmds.addIfNotNull(clause.cmd3);

    if (cmds.length > 0) //
      sqlRequest = sqlRequest.appendSql("(");

    if (clause.bracketOrFilter is Brackets) {
      sqlRequest = sqlRequest.append(getWhereFromCommand((clause.bracketOrFilter as Brackets), isSubCmd: true));
    } else if (clause.bracketOrFilter is Filter) {
      var filter = clause.bracketOrFilter as Filter;
      if (filter is FilterOneValue) {
        var subValue = this.getNextSubstitutionValue();
        sqlRequest = sqlRequest.append(
          SqlRequest("${filter.column.name}${filter.filterOperator}@where$subValue", {"where$subValue": filter.data}),
        );
      }
    }

    if (cmds.length > 0) {
      for (var cmd in cmds) {
        sqlRequest = sqlRequest.append(getWhereFromCommand(cmd, isSubCmd: true));
      }
      sqlRequest = sqlRequest.appendSql(")");
    }

    return sqlRequest;
  }
}
