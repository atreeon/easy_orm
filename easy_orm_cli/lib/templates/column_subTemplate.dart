var column_subTemplate = """--inputs: dbType, dartType, columnName, nullable, tableName

  Column%%%columnType%%%<%%%dartType%%%> %%%columnName%%% = Column%%%columnType%%%<%%%dartType%%%>(
    name: "%%%columnName%%%",
    nullable: %%%nullable%%%,
    datatype: "%%%dbType%%%",
    getValue: (row) => row["%%%tableName%%%"]!["%%%columnName%%%"],
  );
""";