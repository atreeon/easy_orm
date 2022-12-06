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
  "int8": "int",
  "numeric": "double",
  "float4": "double",
  "float8": "double",
  "serial2": "double",
  "serial4": "double",
  "serial8": "double",
  "bool": "bool",
  "bpchar": "String",
  "varchar": "String",
  "text": "String",
  "date": "DateTime",
};

var convertDbTypeToColumnType = {
  "int2": "Numeric",
  "int4": "Numeric",
  "int8": "Numeric",
  "numeric": "Numeric",
  "float4": "Numeric",
  "float8": "Numeric",
  "serial2": "Numeric",
  "serial4": "Numeric",
  "serial8": "Numeric",
  "bool": "Bool",
  "bpchar": "Char",
  "varchar": "Char",
  "text": "Char",
  "date": "DateTime",
};
