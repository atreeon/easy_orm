var expectedService = """import 'package:example/generatedDb/definitions/Us_statesDefinition.dart';
import 'package:example/generatedDb/models/Us_state.dart';
import 'package:easy_orm_postgres/service/IService.dart';
import 'package:postgres/postgres.dart';

class Us_statesService extends IService<Us_statesDefinition, Us_state> {
  final Us_statesDefinition tableDefinition = Us_statesDefinition();
  final PostgreSQLExecutionContext connection;

  Us_statesService(PostgreSQLExecutionContext this.connection);
}
""";
