import 'package:example/generatedDb/definitions/ShippersDefinition.dart';
import 'package:example/generatedDb/models/Shipper.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class ShippersService extends IService<ShippersDefinition, Shipper> {
  final ShippersDefinition tableDefinition = ShippersDefinition();
  final Where Function(ShippersDefinition e)? where;
  final Select<ShippersDefinition> Function(ShippersDefinition e)? select;
  final OrderBy Function(ShippersDefinition e)? orderBy;

  ShippersService({this.where, this.select, this.orderBy});
}
