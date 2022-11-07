import 'package:easy_orm_postgres/ITableDefinition.dart';
import 'package:easy_orm_postgres/SqlRequest.dart';

class InsertClauseCalculator {
  int substitutionValue = 0;

  int getNextSubstitutionValue() {
    var value = substitutionValue;
    this.substitutionValue++;
    return value;
  }

  SqlRequest getInsert<TModel, TDef extends ITableDefinition<TModel>>(
    List<TModel> itemsToInsert,
    TDef tableDefinition,
  ) {
    Map<String, dynamic> substitutionValues = {};

    var insertStatements = itemsToInsert.map(
      (model) {
        var insertRow = '(' +
            tableDefinition.allColumns
                .map(
                  (column) {
                    if (column.isIdentity) {
                      return "default";
                    } else {
                      var subValue = getNextSubstitutionValue();

                      substitutionValues = {
                        ...substitutionValues,
                        ...{"insert$subValue": column.getModelValue(model)}
                      };
                      return "@insert$subValue";
                    }
                  },
                )
                .toList()
                .join(", ") +
            ')';
        return insertRow;
      },
    ).join(",\n");

    return SqlRequest(
      tableDefinition.insertIntoHeader + "\n" + insertStatements + "\nreturning *;",
      substitutionValues,
    );
  }
}
