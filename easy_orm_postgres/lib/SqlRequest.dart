class SqlRequest {
  final String sql;
  final Map<String, dynamic> substitutionValues;

  const SqlRequest(this.sql, this.substitutionValues);

  SqlRequest.bySqlRequests(List<SqlRequest> requests) //
      : this.sql = requests.map((e) => e.sql).join("\n"), //
        this.substitutionValues = requests.map((e) => e.substitutionValues).reduce((map1, map2) => map1..addAll(map2));

  SqlRequest prependSql(String sql) {
    var newRequest = SqlRequest(sql + this.sql, substitutionValues);

    return newRequest;
  }

  SqlRequest appendSql(String sql) {
    var newRequest = SqlRequest("${this.sql}$sql", substitutionValues);

    return newRequest;
  }

  SqlRequest append(SqlRequest sqlRequest) {
    var newRequest = SqlRequest("${this.sql}${sqlRequest.sql}", {...this.substitutionValues, ...sqlRequest.substitutionValues});

    return newRequest;
  }
}
