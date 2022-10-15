import 'package:example/generatedDb/definitions/RegionDefinition.dart';
import 'package:example/generatedDb/models/Region.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class RegionService extends IService<RegionDefinition, Region> {
  final RegionDefinition tableDefinition = RegionDefinition();
  final Where Function(RegionDefinition e)? where;
  final Select<RegionDefinition> Function(RegionDefinition e)? select;
  final OrderBy Function(RegionDefinition e)? orderBy;

  RegionService({this.where, this.select, this.orderBy});
}
