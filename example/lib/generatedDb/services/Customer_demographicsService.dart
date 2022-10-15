import 'package:example/generatedDb/definitions/Customer_demographicsDefinition.dart';
import 'package:example/generatedDb/models/Customer_demographic.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class Customer_demographicsService
    extends IService<Customer_demographicsDefinition, Customer_demographic> {
  final Customer_demographicsDefinition tableDefinition =
      Customer_demographicsDefinition();
  final Where Function(Customer_demographicsDefinition e)? where;
  final Select<Customer_demographicsDefinition> Function(
      Customer_demographicsDefinition e)? select;
  final OrderBy Function(Customer_demographicsDefinition e)? orderBy;

  Customer_demographicsService({this.where, this.select, this.orderBy});
}
