import 'package:easy_orm_postgres/ITableDefinition.dart';
import 'package:easy_orm_postgres/SqlRequest.dart';
import 'package:easy_orm_postgres/clauseObjects/OrderBy.dart';
import 'package:easy_orm_postgres/clauseObjects/Update.dart';
import 'package:easy_orm_postgres/clauseObjects/Where.dart';
import 'package:easy_orm_postgres/column.dart';
import 'package:easy_orm_postgres/dbConnection/getPostgresConnectionFromConfig.dart';
import 'package:easy_orm_postgres/service/SqlResponse.dart';
import 'package:easy_orm_postgres/service/getDelete.dart';
import 'package:easy_orm_postgres/service/getFrom.dart';
import 'package:easy_orm_postgres/service/getInsert.dart';
import 'package:easy_orm_postgres/service/getOrderBy.dart';
import 'package:easy_orm_postgres/service/getRowCustom.dart';
import 'package:easy_orm_postgres/service/getSelect.dart';
import 'package:easy_orm_postgres/service/getUpdate.dart';
import 'package:easy_orm_postgres/service/getWhere.dart';
import 'package:postgres/postgres.dart';
import 'package:tuple/tuple.dart';

enum eQueryType { mappedResultsQuery, execute }

///Abstract service (or query that is defined) that is used to specify
/// the query in code to then translate it into sql
class EasyOrm<TModel, TDef extends ITableDefinition<TModel>> {
  final TDef tableDefinition;

  EasyOrm(this.tableDefinition);

  Future<SqlResponse<List<TModel>>> selectQuery({
    Where Function(TDef e)? where,
    OrderBy Function(TDef e)? orderBy,
    PostgreSQLExecutionContext? cn = null,
  }) async {
    var result = _selectQuery(runQueryToTModel, where, orderBy, cn);
    return result;
  }

  Future<SqlResponse<List<TType1>>> selectQuery1Col<TType1, TType2>(
    Column<TType1, TModel> Function(TDef e) col1, {
    Where Function(TDef e)? where,
    OrderBy Function(TDef e)? orderBy,
    PostgreSQLExecutionContext? cn = null,
  }) async {
    var result = _selectQuery((x, conn) => runQueryToReturnType(x, getRowCustom1<TType1>, conn), where, orderBy, cn, col1);
    return result;
  }

  Future<SqlResponse<List<Tuple2<TType1, TType2>>>> selectQuery2Cols<TType1, TType2>(
    Column<TType1, TModel> Function(TDef e) col1,
    Column<TType2, TModel> Function(TDef e) col2, {
    Where Function(TDef e)? where,
    OrderBy Function(TDef e)? orderBy,
    PostgreSQLExecutionContext? cn = null,
  }) async {
    var result = _selectQuery((x, conn) => runQueryToReturnType(x, getRowCustom2<TType1, TType2>, conn), where, orderBy, cn, col1, col2);
    return result;
  }

  Future<SqlResponse<List<Tuple3<TType1, TType2, TType3>>>> selectQuery3Cols<TType1, TType2, TType3>(
    Column<TType1, TModel> Function(TDef e) col1,
    Column<TType2, TModel> Function(TDef e) col2,
    Column<TType3, TModel> Function(TDef e) col3, {
    Where Function(TDef e)? where,
    OrderBy Function(TDef e)? orderBy,
    PostgreSQLExecutionContext? cn,
  }) async {
    var result = _selectQuery((x, conn) => runQueryToReturnType(x, getRowCustom3<TType1, TType2, TType3>, conn), where, orderBy, cn, col1, col2, col3);
    return result;
  }

  Future<SqlResponse<List<TType1>>> selectQueryBy<TType1, TType2>(
    Column<TType1, TModel> Function(TDef e) col1,
    Column<TType2, TModel> Function(TDef e) col2, {
    Where Function(TDef e)? where,
    OrderBy Function(TDef e)? orderBy,
    PostgreSQLExecutionContext? cn,
  }) async {
    var result = _selectQuery(
      (x, conn) => runQueryToReturnType(x, getRowCustom1<TType1>, conn),
      where,
      orderBy,
      cn,
      col1,
      col2,
    );
    return result;
  }

  Future<SqlResponse<List<TReturnType>>> _selectQuery<TReturnType>(
    Future<SqlResponse<List<TReturnType>>> fnRunQueryToX(SqlRequest request, PostgreSQLExecutionContext? cn),
    Where Function(TDef e)? where,
    OrderBy Function(TDef e)? orderBy,
    PostgreSQLExecutionContext? cn, [
    Column Function(TDef e)? col1,
    Column Function(TDef e)? col2,
    Column Function(TDef e)? col3,
    Column Function(TDef e)? col4,
  ]) async {
    var selectRequest = getSelect(this.tableDefinition, col1, col2, col3, col4);

    var whereRequest = getWhere(where, this.tableDefinition);

    var fromRequest = getFrom(this.tableDefinition);

    var orderByRequest = getOrderBy(orderBy, this.tableDefinition);

    var request = SqlRequest.bySqlRequests([selectRequest, fromRequest, whereRequest, orderByRequest]);

    var result = await fnRunQueryToX(request, cn);

    return result;
  }

  ///Updates records and returns a list of all updated records
  Future<SqlResponse<List<TModel>>> updateRecords({
    required UpdateCustom<TDef> Function(TDef e) set,
    required Where Function(TDef e) where,
    PostgreSQLExecutionContext? cn = null,
  }) async {
    var request = _updateRecordsGetRequest(set, where);

    request = request.appendSql("\n returning *;");

    var result = await runQueryToTModel(request, cn);
    return result;
  }

  ///Updates records but doesn't return a list of updated records
  Future<SqlResponse<int>> updateRecordsNoReturn({
    required UpdateCustom<TDef> Function(TDef e) set,
    required Where Function(TDef e) where,
    PostgreSQLExecutionContext? cn = null,
  }) async {
    var request = _updateRecordsGetRequest(set, where);

    var result = await runExecute(request, cn);
    return result;
  }

  SqlRequest _updateRecordsGetRequest(
    UpdateCustom<TDef> Function(TDef e) set,
    Where Function(TDef e) where,
  ) {
    var updateRequest = UpdateClauseCalculator().getUpdate(set, this.tableDefinition);

    var whereRequest = getWhere(where, this.tableDefinition);

    var request = SqlRequest.bySqlRequests([updateRequest, whereRequest]);

    return request;
  }

  Future<SqlResponse<List<TModel>>> insertRecords(
    List<TModel> itemsToInsert, {
    PostgreSQLExecutionContext? cn = null,
  }) async {
    var insertRequest = InsertClauseCalculator().getInsert(itemsToInsert, this.tableDefinition);

    var result = await runQueryToTModel(insertRequest, cn);

    return result;
  }

  Future<SqlResponse<int>> deleteRecords(
    Where Function(TDef e) where, {
    PostgreSQLExecutionContext? cn = null,
  }) async {
    var delete = getDelete();
    var from = getFrom(this.tableDefinition);
    var whereRequest = getWhere(where, this.tableDefinition);

    var deleteRequest = SqlRequest.bySqlRequests([delete, from, whereRequest]);

    var result = await runExecute(deleteRequest, cn);

    return result;
  }

  //#region supporting functions

  dynamic _runQuery(
    eQueryType queryType,
    SqlRequest request,
    PostgreSQLExecutionContext cn,
  ) async {
    if (queryType == eQueryType.mappedResultsQuery) {
      return await cn.mappedResultsQuery(
        request.sql,
        substitutionValues: request.substitutionValues,
      );
    } else if (queryType == eQueryType.execute) {
      return await cn.execute(
        request.sql,
        substitutionValues: request.substitutionValues,
      );
    }

    throw Exception("not implemented exception");
  }

  Future<SqlResponse<List<TReturnType>>> runQueryToReturnType<TReturnType>(
    SqlRequest request,
    TReturnType fnGetReturnTypeFromRow(Map<String, Map<String, dynamic>> row),
    PostgreSQLExecutionContext? cn,
  ) async {
    var response = await _runQueryT<List<Map<String, Map<String, dynamic>>>>(eQueryType.mappedResultsQuery, request, cn);

    if (response is SqlResponse_Failure<List<Map<String, Map<String, dynamic>>>>) {
      return SqlResponse_Failure<List<TReturnType>>(response.failureMessage + "\n" + request.sql);
    }

    var typedResult = (response as SqlResponse_Success<List<Map<String, Map<String, dynamic>>>>) //
        .result
        .map((row) => fnGetReturnTypeFromRow(row))
        .toList();
    return SqlResponse_Success<List<TReturnType>>(typedResult);
  }

  Future<SqlResponse<List<TModel>>> runQueryToTModel(
    SqlRequest request,
    PostgreSQLExecutionContext? cn,
  ) async {
    return runQueryToReturnType(request, tableDefinition.getTypeFromRow, cn);
  }

  Future<SqlResponse<int>> runExecute(SqlRequest request, PostgreSQLExecutionContext? cn) async {
    var response = await _runQueryT<int>(eQueryType.execute, request, cn);

    return response;
  }

  Future<SqlResponse<T>> _runQueryT<T>(
    eQueryType queryType,
    SqlRequest request,
    PostgreSQLExecutionContext? connection,
  ) async {
    T dbResult;
    late PostgreSQLExecutionContext cn;

    if (connection == null) {
      var newCn = await getPostgresConnectionFromConfig();
      await newCn.open();
      cn = newCn;
    } else {
      cn = connection;
    }

    try {
      dbResult = await _runQuery(queryType, request, cn);
    } catch (e) {
      return SqlResponse_Failure<T>(e.toString() + "\n" + request.sql);
    } finally {
      if (connection == null) {
        //cn is always PostgreSQLConnection if connection is null
        await (cn as PostgreSQLConnection).close();
      }
    }
    return SqlResponse_Success<T>(dbResult);
  }
//#endregion

}
