var db_template = """
import 'package:easy_orm_postgres/service/EasyOrm.dart';
~~~models|importStatementTemplate~~~
~~~definitions|importStatementTemplate~~~

class Db {
~~~tables|tableNameTemplate~~~
}
""";
