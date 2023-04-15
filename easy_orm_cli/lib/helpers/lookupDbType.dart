///convert the database type to eith the dart or column type (easy_orm)

String lookupDbType(String dbType, Map<String, String> lookup) {
  var result = lookup[dbType];
  if (result == null) //
    throw Exception("DbType '$dbType' not found");

  return result;
}

Set<String> getSupportedDataTypes() {
  return convertDbTypeToDartType.keys.toSet();
}

// var unsupportedColumnTypes = [
//   "bit",
//   "varbit",
//   "box",
//   "bytea",
//   "cidr",
//   "circle",
//   "inet",
//   "bytea",
//   "interval",
//   "json",
//   "jsonb",
//   "line",
//   "lseg",
//   "macaddr",
//   "macaddr8",
//   "path",
//   "pg_lsn",
//   "pg_snapshot",
//   "point",
//   "polygon",
//   "time",
//   "timez",
//   "timestamp",
//   "timestampz",
//   "tsquery",
//   "tsvector",
//   "txid_snapshot",
//   "uuid",
//   "xml",
// ];

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
  "uuid": "String",
  "json": "String",
  "date": "DateTime",
  "time": "DateTime",
  "timez": "DateTime",
  "timetz": "DateTime",
  "timestamp": "DateTime",
  "timestampz": "DateTime",
  "timestamptz": "DateTime",
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
  "uuid": "Char",
  "json": "Char",
  "date": "DateTime",
  "time": "DateTime",
  "timez": "DateTime",
  "timetz": "DateTime",
  "timestamp": "DateTime",
  "timestampz": "DateTime",
  "timestamptz": "DateTime",
};
