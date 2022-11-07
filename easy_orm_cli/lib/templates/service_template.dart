var service_template = """--inputs: packageName, name, modelName
import 'package:%%%packageName%%%/generatedDb/definitions/%%%name%%%Definition.dart';
import 'package:%%%packageName%%%/generatedDb/models/%%%modelName%%%.dart';
import 'package:easy_orm_postgres/service/IService.dart';
import 'package:postgres/postgres.dart';

class %%%name%%%Service extends IService<%%%name%%%Definition, %%%modelName%%%> {
  final %%%name%%%Definition tableDefinition = %%%name%%%Definition();
  final PostgreSQLExecutionContext connection;

  %%%name%%%Service(PostgreSQLExecutionContext this.connection);
}""";