import 'package:example/generatedDb/definitions/ProductsDefinition.dart';
import 'package:example/generatedDb/models/Product.dart';
import 'package:easy_orm_engine/IService.dart';
import 'package:easy_orm_engine/clauseObjects/OrderBy.dart';
import 'package:easy_orm_engine/clauseObjects/Select.dart';
import 'package:easy_orm_engine/clauseObjects/Where.dart';

class ProductsService extends IService<ProductsDefinition, Product> {
  final ProductsDefinition tableDefinition = ProductsDefinition();
  final Where Function(ProductsDefinition e)? where;
  final Select<ProductsDefinition> Function(ProductsDefinition e)? select;
  final OrderBy Function(ProductsDefinition e)? orderBy;

  ProductsService({this.where, this.select, this.orderBy});
}
