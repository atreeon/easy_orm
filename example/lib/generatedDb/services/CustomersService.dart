import 'package:example/generatedDb/definitions/CustomersDefinition.dart';
import 'package:example/generatedDb/models/Customer.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class CustomersService extends IService<CustomersDefinition, Customer> {
  final CustomersDefinition tableDefinition = CustomersDefinition();
  final Where Function(CustomersDefinition e)? where;
  final Select<CustomersDefinition> Function(CustomersDefinition e)? select;
  final OrderBy Function(CustomersDefinition e)? orderBy;

  CustomersService({this.where, this.select, this.orderBy});
}
