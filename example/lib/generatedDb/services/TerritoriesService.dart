import 'package:example/generatedDb/definitions/TerritoriesDefinition.dart';
import 'package:example/generatedDb/models/Territorie.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class TerritoriesService extends IService<TerritoriesDefinition, Territorie> {
  final TerritoriesDefinition tableDefinition = TerritoriesDefinition();
  final Where Function(TerritoriesDefinition e)? where;
  final Select<TerritoriesDefinition> Function(TerritoriesDefinition e)? select;
  final OrderBy Function(TerritoriesDefinition e)? orderBy;

  TerritoriesService({this.where, this.select, this.orderBy});
}
