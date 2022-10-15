import 'package:example/generatedDb/definitions/CategoriesDefinition.dart';
import 'package:example/generatedDb/models/Categorie.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class CategoriesService extends IService<CategoriesDefinition, Categorie> {
  final CategoriesDefinition tableDefinition = CategoriesDefinition();
  final Where Function(CategoriesDefinition e)? where;
  final Select<CategoriesDefinition> Function(CategoriesDefinition e)? select;
  final OrderBy Function(CategoriesDefinition e)? orderBy;

  CategoriesService({this.where, this.select, this.orderBy});
}
