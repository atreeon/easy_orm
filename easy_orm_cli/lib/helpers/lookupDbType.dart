///convert the database type to eith the dart or column type (easy_orm)

String lookupDbType(String dbType, Map<String, String> lookup) {
  var result = lookup[dbType];
  if (result == null) //
    throw Exception("DbType '$dbType' not found");

  return result;
}

var convertDbTypeToDartType = {
  "int2": "int",
  "int4": "int",
  "bool": "bool",
  "bpchar": "String",
  "bytea": "String",
  "date": "String",
  "text": "String",
  "varchar": "String",
  "float4": "double",
  "numeric": "double",
};

var convertDbTypeToColumnType = {
  "int2": "Numeric",
  "int4": "Numeric",
  "bool": "bool",
  "bpchar": "Char",
  "bytea": "Char",
  "date": "Char",
  "text": "Char",
  "varchar": "Char",
  "float4": "Numeric",
  "numeric": "Numeric",
};
