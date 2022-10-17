///convert the database type to eith the dart or column type (easy_orm)

String lookupDbType(String dbType, Map<String, String> lookup) {
  var result = lookup[dbType];
  if (result == null) //
    throw Exception("DbType '$dbType' not found");

  return result;
}

var unsupportedColumnTypes = ["bytea"];

var convertDbTypeToDartType = {
  "int2": "int",
  "int4": "int",
  "bool": "bool",
  "bpchar": "String",
  // "bytea": "Uint8List",
  "date": "DateTime",
  "text": "String",
  "varchar": "String",
  "float4": "double",
  "numeric": "double",
};

var convertDbTypeToColumnType = {
  "int2": "Numeric",
  "int4": "Numeric",
  "bool": "Bool",
  "bpchar": "Char",
  // "bytea": "Uint8List",
  "date": "DateTime",
  "text": "Char",
  "varchar": "Char",
  "float4": "Numeric",
  "numeric": "Numeric",
};
