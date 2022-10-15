import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

import '../freezedTest/EmployeeFreezed.dart';
import 'EmployeeDefinition.dart';

class EmployeeService extends IService<EmployeeDefinition, EmployeeF> {
  final EmployeeDefinition tableDefinition = EmployeeDefinition();
  final Where Function(EmployeeDefinition e)? where;
  final Select<EmployeeDefinition> Function(EmployeeDefinition e)? select;
  final OrderBy Function(EmployeeDefinition e)? orderBy;

  EmployeeService({this.where, this.select, this.orderBy});
}
