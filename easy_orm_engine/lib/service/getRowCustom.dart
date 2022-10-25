import 'package:tuple/tuple.dart';

TType1 getRowCustom1<TType1>(
  Map<String, Map<String, dynamic>> row,
) {
  var tableName = row.keys.first;

  return row[tableName]![row[tableName]!.keys.first];
}

Tuple2<TType1, TType2> getRowCustom2<TType1, TType2>(
  Map<String, Map<String, dynamic>> row,
) {
  var tableName = row.keys.first;

  var result = Tuple2<TType1, TType2>(
    row[tableName]![row[tableName]!.keys.first],
    row[tableName]![row[tableName]!.keys.skip(1).first],
  );
  return result;
}

Tuple3<TType1, TType2, TType3> getRowCustom3<TType1, TType2, TType3>(
  Map<String, Map<String, dynamic>> row,
) {
  var tableName = row.keys.first;

  var result = Tuple3<TType1, TType2, TType3>(
    row[tableName]![row[tableName]!.keys.first],
    row[tableName]![row[tableName]!.keys.skip(1).first],
    row[tableName]![row[tableName]!.keys.skip(2).first],
  );
  return result;
}

Tuple4<TType1, TType2, TType3, TType4> getRowCustom4<TType1, TType2, TType3, TType4>(
  Map<String, Map<String, dynamic>> row,
) {
  var tableName = row.keys.first;

  var result = Tuple4<TType1, TType2, TType3, TType4>(
    row[tableName]![row[tableName]!.keys.first],
    row[tableName]![row[tableName]!.keys.skip(1).first],
    row[tableName]![row[tableName]!.keys.skip(2).first],
    row[tableName]![row[tableName]!.keys.skip(3).first],
  );
  return result;
}
//
// ///receives a row (map) and then outputs the desired type
// dynamic getRowCustom<TDef extends ITableDefinition>(
//   Map<String, Map<String, dynamic>> row,
//   SelectCustom2<TDef> Function(TDef e) select,
//   TDef tableDefinition,
// ) {
//   var tableName = row.keys.first;
//
//   var selectReal = select(tableDefinition);
//
//   if (selectReal.columns.length == 1) {
//     return row[tableName]![row[tableName]!.keys.first];
//   }
//   if (selectReal.columns.length == 2) {
//     return Tuple2(
//       row[tableName]![row[tableName]!.keys.first],
//       row[tableName]![row[tableName]!.keys.skip(1).first],
//     );
//   }
//   if (selectReal.columns.length == 3) {
//     return Tuple3(
//       row[tableName]![row[tableName]!.keys.first],
//       row[tableName]![row[tableName]!.keys.skip(1).first],
//       row[tableName]![row[tableName]!.keys.skip(2).first],
//     );
//   }
//   throw Exception("max of 3 columns, add issue to github");
// }
