var propertySet_subTemplate = """--inputs: columnName
%%%columnName%%%: getTypeFromDbRow(this.tableName, this.%%%columnName%%%, row),
""";
