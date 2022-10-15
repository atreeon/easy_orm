import 'package:example/generatedDb/definitions/Customer_customer_demoDefinition.dart';
import 'package:example/generatedDb/models/Customer_customer_demo.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class Customer_customer_demoService
    extends IService<Customer_customer_demoDefinition, Customer_customer_demo> {
  final Customer_customer_demoDefinition tableDefinition =
      Customer_customer_demoDefinition();
  final Where Function(Customer_customer_demoDefinition e)? where;
  final Select<Customer_customer_demoDefinition> Function(
      Customer_customer_demoDefinition e)? select;
  final OrderBy Function(Customer_customer_demoDefinition e)? orderBy;

  Customer_customer_demoService({this.where, this.select, this.orderBy});
}
