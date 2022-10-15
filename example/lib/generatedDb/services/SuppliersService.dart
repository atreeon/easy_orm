import 'package:example/generatedDb/definitions/SuppliersDefinition.dart';
import 'package:example/generatedDb/models/Supplier.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class SuppliersService extends IService<SuppliersDefinition, Supplier> {
  final SuppliersDefinition tableDefinition = SuppliersDefinition();
  final Where Function(SuppliersDefinition e)? where;
  final Select<SuppliersDefinition> Function(SuppliersDefinition e)? select;
  final OrderBy Function(SuppliersDefinition e)? orderBy;

  SuppliersService({this.where, this.select, this.orderBy});
}
