import 'package:example/generatedDb/definitions/Us_statesDefinition.dart';
import 'package:example/generatedDb/models/Us_state.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class Us_statesService extends IService<Us_statesDefinition, Us_state> {
  final Us_statesDefinition tableDefinition = Us_statesDefinition();
  final Where Function(Us_statesDefinition e)? where;
  final Select<Us_statesDefinition> Function(Us_statesDefinition e)? select;
  final OrderBy Function(Us_statesDefinition e)? orderBy;

  Us_statesService({this.where, this.select, this.orderBy});
}
