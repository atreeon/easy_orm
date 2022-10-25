import 'package:easy_orm_engine/ITableDefinition.dart';
import 'package:easy_orm_engine/SqlRequest.dart';
import 'package:easy_orm_engine/clauseObjects/Update.dart';

class UpdateClauseCalculator {
  int substitutionValue = 0;

  int getNextSubstitutionValue() {
    var value = substitutionValue;
    this.substitutionValue++;
    return value;
  }

  SqlRequest getUpdate<TDef extends ITableDefinition<TModel>, TModel>(
    Update<TDef> Function(TDef e) update,
    TDef tableDefinition,
  ) {
    var updateObj = update(tableDefinition);

    if (updateObj is! UpdateCustom<TDef>) {
      throw Exception("only update supported is UpdateCustom");
    }

    var substitutionKeys = <String, dynamic>{};

    var setStatements = updateObj.columns.entries.map((e) {
      var subValue = getNextSubstitutionValue();
      substitutionKeys = {
        ...substitutionKeys,
        ...{"update$subValue": e.value}
      };
      return "${e.key.name} = @update$subValue";
    }).join(", ");

    var result = SqlRequest(
      "update ${tableDefinition.tableName} set $setStatements",
      substitutionKeys,
    );

    return result;
  }
}
