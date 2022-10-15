import 'package:example/generatedDb/definitions/Employee_territoriesDefinition.dart';
import 'package:example/generatedDb/models/Employee_territorie.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class Employee_territoriesService
    extends IService<Employee_territoriesDefinition, Employee_territorie> {
  final Employee_territoriesDefinition tableDefinition =
      Employee_territoriesDefinition();
  final Where Function(Employee_territoriesDefinition e)? where;
  final Select<Employee_territoriesDefinition> Function(
      Employee_territoriesDefinition e)? select;
  final OrderBy Function(Employee_territoriesDefinition e)? orderBy;

  Employee_territoriesService({this.where, this.select, this.orderBy});
}
