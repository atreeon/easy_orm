import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:easy_orm_engine/SqlRequest.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Update.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';
import 'package:easy_orm_engine/column.dart';
import 'package:easy_orm_engine/service/SqlResponse.dart';
import 'package:easy_orm_engine/service/getDelete.dart';
import 'package:easy_orm_engine/service/getFrom.dart';
import 'package:easy_orm_engine/service/getInsert.dart';
import 'package:easy_orm_engine/service/getOrderBy.dart';
import 'package:easy_orm_engine/service/getRowCustom.dart';
import 'package:easy_orm_engine/service/getSelect.dart';
import 'package:easy_orm_engine/service/getUpdate.dart';
import 'package:easy_orm_engine/service/getWhere.dart';
import 'package:postgres/postgres.dart';
import 'package:tuple/tuple.dart';

enum eQueryType { mappedResultsQuery, execute }

///Abstract service (or query that is defined) that is used to specify
/// the query in code to then translate it into sql
class EasyOrm<TModel, TDef extends ITableDefinition<TModel>> {
  final PostgreSQLExecutionContext connection;
  final TDef tableDefinition;

  EasyOrm(this.connection, this.tableDefinition);

  Future<SqlResponse<List<TModel>>> selectQuery({
    Where Function(TDef e)? where,
    OrderBy Function(TDef e)? orderBy,
  }) async {
    var result = _selectQuery(runQueryToTModel, where, orderBy, null);
    return result;
  }

  Future<SqlResponse<List<TType1>>> selectQuery1Col<TType1, TType2>(
    Column<TType1, TModel> Function(TDef e) col1, {
    Where Function(TDef e)? where,
    OrderBy Function(TDef e)? orderBy,
  }) async {
    var result = _selectQuery((x) => runQueryToReturnType(x, getRowCustom1<TType1>), where, orderBy, col1);
    return result;
  }

  Future<SqlResponse<List<Tuple2<TType1, TType2>>>> selectQuery2Cols<TType1, TType2>(
    Column<TType1, TModel> Function(TDef e) col1,
    Column<TType2, TModel> Function(TDef e) col2, {
    Where Function(TDef e)? where,
    OrderBy Function(TDef e)? orderBy,
  }) async {
    var result = _selectQuery((x) => runQueryToReturnType(x, getRowCustom2<TType1, TType2>), where, orderBy, col1, col2);
    return result;
  }

  Future<SqlResponse<List<Tuple3<TType1, TType2, TType3>>>> selectQuery3Cols<TType1, TType2, TType3>(
    Column<TType1, TModel> Function(TDef e) col1,
    Column<TType2, TModel> Function(TDef e) col2,
    Column<TType3, TModel> Function(TDef e) col3, {
    Where Function(TDef e)? where,
    OrderBy Function(TDef e)? orderBy,
  }) async {
    var result = _selectQuery((x) => runQueryToReturnType(x, getRowCustom3<TType1, TType2, TType3>), where, orderBy, col1, col2);
    return result;
  }

  Future<SqlResponse<List<TReturnType>>> _selectQuery<TReturnType>(
    Future<SqlResponse<List<TReturnType>>> fnRunQueryToX(SqlRequest request),
    Where Function(TDef e)? where,
    OrderBy Function(TDef e)? orderBy, [
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

    var result = await fnRunQueryToX(request);

    return result;
  }

  ///Updates records and returns a list of all updated records
  Future<SqlResponse<List<TModel>>> updateRecords({
    required UpdateCustom<TDef> Function(TDef e) set,
    required Where Function(TDef e) where,
  }) async {
    var request = _updateRecordsGetRequest(set, where);

    request = request.appendSql("\n returning *;");

    var result = await runQueryToTModel(request);
    return result;
  }

  ///Updates records but doesn't return a list of updated records
  Future<SqlResponse<int>> updateRecordsNoReturn({
    required UpdateCustom<TDef> Function(TDef e) set,
    required Where Function(TDef e) where,
  }) async {
    var request = _updateRecordsGetRequest(set, where);

    var result = await runExecute(request);
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
    List<TModel> itemsToInsert,
  ) async {
    var insertRequest = InsertClauseCalculator().getInsert(itemsToInsert, this.tableDefinition);

    var result = await runQueryToTModel(insertRequest);

    return result;
  }

  Future<SqlResponse<int>> deleteRecords(
    Where Function(TDef e) where,
  ) async {
    var delete = getDelete();
    var from = getFrom(this.tableDefinition);
    var whereRequest = getWhere(where, this.tableDefinition);

    var deleteRequest = SqlRequest.bySqlRequests([delete, from, whereRequest]);

    var result = await runExecute(deleteRequest);

    return result;
  }

  //#region supporting functions

  dynamic _runQuery(eQueryType queryType, SqlRequest request, PostgreSQLExecutionContext cn) async {
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
  ) async {
    var response = await _runQueryT<List<Map<String, Map<String, dynamic>>>>(eQueryType.mappedResultsQuery, request);

    if (response is SqlResponse_Failure<List<Map<String, Map<String, dynamic>>>>) {
      return SqlResponse_Failure<List<TReturnType>>(response.failureMessage + "\n" + request.sql);
    }

    var typedResult = (response as SqlResponse_Success<List<Map<String, Map<String, dynamic>>>>) //
        .result
        .map((row) => fnGetReturnTypeFromRow(row))
        .toList();
    return SqlResponse_Success<List<TReturnType>>(typedResult);
  }

  Future<SqlResponse<List<TModel>>> runQueryToTModel(SqlRequest request) async {
    return runQueryToReturnType(request, tableDefinition.getTypeFromRow);
  }

  Future<SqlResponse<int>> runExecute(SqlRequest request) async {
    var response = await _runQueryT<int>(eQueryType.execute, request);

    return response;
  }

  Future<SqlResponse<T>> _runQueryT<T>(
    eQueryType queryType,
    SqlRequest request,
  ) async {
    T dbResult;
    try {
      if (connection is PostgreSQLConnection) {
        await (connection as PostgreSQLConnection).open();
      }
      dbResult = await _runQuery(queryType, request, connection);
    } catch (e) {
      return SqlResponse_Failure<T>(e.toString() + "\n" + request.sql);
    } finally {
      if (connection is PostgreSQLConnection) {
        await (connection as PostgreSQLConnection).close();
      }
    }
    return SqlResponse_Success<T>(dbResult);
  }
//#endregion

}
