var column_subTemplate = """--inputs: dbType, dartType, columnName, nullable, tableName

  Column%%%columnType%%%<%%%dartType%%%, %%%modelName%%%> %%%columnName%%% = Column%%%columnType%%%<%%%dartType%%%, %%%modelName%%%>(
    name: "%%%columnName%%%",
    nullable: %%%nullable%%%,
    isIdentity: %%%isIdentity%%%,
    datatype: "%%%dbType%%%",
    getDbValue: (row) => row["%%%tableName%%%"]!["%%%columnName%%%"],
    getModelValue: (model) => model.%%%columnName%%%,
  );
""";