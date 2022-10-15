import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';
import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/helpers/helpers.dart';
import 'package:tuple/tuple.dart';

///Abstract service (or query that is defined) that is used to specify
/// the query in code to then translate it into sql
abstract class IService<TDef extends ITableDefinition, TType> {
  TDef get tableDefinition;
  Where Function(TDef e)? get where;
  Select<TDef> Function(TDef e)? get select;
  OrderBy Function(TDef e)? get orderBy;

  String getSql() {
    var sql = StringBuffer();
    sql.writeln(getSelect());
    sql.writeln(getFrom());
    sql.writeln(getWhere());
    sql.writeln(getOrderBy());
    return sql.toString();
  }

  String getSelect() {
    late Select<TDef> selectReal;
    if (select == null) {
      selectReal = SelectDefault<TDef>();
    } else {
      selectReal = select!(this.tableDefinition);
    }

    if (selectReal is SelectDefault<TDef>) {
      return "select * ";
    }

    if (selectReal is SelectCustom2<TDef>) {
      return "select " + selectReal.columns.map((e) => e.name).join(", ");
    }

    throw Exception();
  }

  ///receives a row from the db (a map) and then outputs the desired type
  TType getTypeFromRow(Map<String, Map<String, dynamic>> row) {
    return tableDefinition.getTypeFromRow(row);
  }

  String getOrderBy() {
    late OrderBy orderByObj;

    if (orderBy == null) //
      return '';

    orderByObj = orderBy!(tableDefinition);

    return 'order by ' +
        orderByObj.columns //
            .map((e) => "${e.column.name} ${e.isAscending ? 'ASC' : 'DESC'}")
            .join(", ");
  }

  /*todo: possible split getRow into getRowEmployee, getRowTuple, getRowCustom
  employee getRowEmployee ()
  dynamic getRowTuple ()
  generic getRowCustom ()
  then switch on this outside of here*/
  ///receives a row (map) and then outputs the desired type
  dynamic getRow(Map<String, Map<String, dynamic>> row) {
    late Select<ITableDefinition> selectReal;
    if (select == null) {
      selectReal = SelectDefault<ITableDefinition>();
    } else {
      selectReal = select!(this.tableDefinition);
    }

    if (selectReal is SelectDefault<ITableDefinition>) {
      return tableDefinition.getTypeFromRow(row);
    } else if (selectReal is SelectCustom2<ITableDefinition>) {
      var blah = row.keys.first;
      if (selectReal.columns.length == 1) {
        return row[blah]![row[blah]!.keys.first];
      }
      if (selectReal.columns.length == 2) {
        return Tuple2(
          row[blah]![row[blah]!.keys.first],
          row[blah]![row[blah]!.keys.skip(1).first],
        );
      }
      if (selectReal.columns.length == 3) {
        return Tuple3(
          row[blah]![row[blah]!.keys.first],
          row[blah]![row[blah]!.keys.skip(1).first],
          row[blah]![row[blah]!.keys.skip(2).first],
        );
      }
      throw Exception("max of 3 columns, add issue to github");
    }
  }

  ///'from' clause
  String getFrom() {
    return "from ${tableDefinition.tableName}";
  }

  ///'where' clause
  String getWhere() {
    // var result = tableName + "?";
    var result = "";
    if (where != null) {
      var whereObj = where!(this.tableDefinition);

      result += getWhereFromCommand(whereObj);
    }
    return "where " + result;
  }

  ///generate 'where' clause
  String getWhereFromCommand(ClauseSuper clause, {String url = "", bool isSubCmd = false}) {
    if (clause.sql != null) //
      url += " ${clause.sql} ";

    var cmds = <Command>[];
    cmds.addIfNull(clause.cmd1);
    cmds.addIfNull(clause.cmd2);
    cmds.addIfNull(clause.cmd3);

    if (cmds.length > 0) //
      url += "(";

    if (clause.bracketOrFilter is Brackets) {
      url += getWhereFromCommand((clause.bracketOrFilter as Brackets), isSubCmd: true);
    } else if (clause.bracketOrFilter is Filter) {
      var filter = clause.bracketOrFilter as Filter;
      if (filter is FilterOneValue) {
        if (filter.column is ColumnNumeric) {
          url += "${filter.column.name}${filter.filterOperator}${filter.data.toString()}";
        } else if (filter.column is ColumnChar) {
          url += "${filter.column.name}${filter.filterOperator}'${filter.data.toString()}'";
        }
      }
    }

    if (cmds.length > 0) {
      for (var cmd in cmds) {
        url += getWhereFromCommand(cmd, isSubCmd: true);
      }
      url += ")";
    }

    // url = url.substring(0, url.length - 1);
    // return url.trim() + ")";
    return url;
  }
}
