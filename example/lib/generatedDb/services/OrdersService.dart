import 'package:example/generatedDb/definitions/OrdersDefinition.dart';
import 'package:example/generatedDb/models/Order.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class OrdersService extends IService<OrdersDefinition, Order> {
  final OrdersDefinition tableDefinition = OrdersDefinition();
  final Where Function(OrdersDefinition e)? where;
  final Select<OrdersDefinition> Function(OrdersDefinition e)? select;
  final OrderBy Function(OrdersDefinition e)? orderBy;

  OrdersService({this.where, this.select, this.orderBy});
}
