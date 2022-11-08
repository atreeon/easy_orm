import 'package:easy_orm_postgres/SqlRequest.dart';

///'from' clause
SqlRequest getDelete() {
  return SqlRequest("delete", {});
}
