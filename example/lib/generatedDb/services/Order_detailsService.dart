import 'package:example/generatedDb/definitions/Order_detailsDefinition.dart';
import 'package:example/generatedDb/models/Order_detail.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class Order_detailsService
    extends IService<Order_detailsDefinition, Order_detail> {
  final Order_detailsDefinition tableDefinition = Order_detailsDefinition();
  final Where Function(Order_detailsDefinition e)? where;
  final Select<Order_detailsDefinition> Function(Order_detailsDefinition e)?
      select;
  final OrderBy Function(Order_detailsDefinition e)? orderBy;

  Order_detailsService({this.where, this.select, this.orderBy});
}
