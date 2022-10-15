import 'package:example/generatedDb/definitions/EmployeesDefinition.dart';
import 'package:example/generatedDb/models/Employee.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class EmployeesService extends IService<EmployeesDefinition, Employee> {
  final EmployeesDefinition tableDefinition = EmployeesDefinition();
  final Where Function(EmployeesDefinition e)? where;
  final Select<EmployeesDefinition> Function(EmployeesDefinition e)? select;
  final OrderBy Function(EmployeesDefinition e)? orderBy;

  EmployeesService({this.where, this.select, this.orderBy});
}
