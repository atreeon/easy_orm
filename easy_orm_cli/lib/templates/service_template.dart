var service_template = """--inputs: className, modelName
import 'package:%%%packageName%%%/generatedDb/definitions/%%%name%%%Definition.dart';
import 'package:%%%packageName%%%/generatedDb/models/%%%modelName%%%.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class %%%name%%%Service extends IService<%%%name%%%Definition, %%%modelName%%%> {
  final %%%name%%%Definition tableDefinition = %%%name%%%Definition();
  final Where Function(%%%name%%%Definition e)? where;
  final Select<%%%name%%%Definition> Function(%%%name%%%Definition e)? select;
  final OrderBy Function(%%%name%%%Definition e)? orderBy;

  %%%name%%%Service({this.where, this.select, this.orderBy});
}""";