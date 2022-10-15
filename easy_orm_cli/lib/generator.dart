import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:postgres/postgres.dart';
import 'package:postgrest_cli/helpers/convertRawTablesToTables.dart';
import 'package:postgrest_cli/helpers/getTablesRawFromDb.dart';
import 'package:postgrest_cli/helpers/tablesToTemplateMap.dart';
import 'package:postgrest_cli/templates/column_subTemplate.dart';
import 'package:postgrest_cli/templates/definition_template.dart';
import 'package:postgrest_cli/templates/modelParameters_subTemplate.dart';
import 'package:postgrest_cli/templates/model_template.dart';
import 'package:postgrest_cli/templates/propertySet_subTemplate.dart';
import 'package:postgrest_cli/templates/service_template.dart';
import 'package:postgrest_cli/util/dePluralise.dart';
import 'package:templater_atreeon/templater_atreeon.dart';

Future<List<String>> performGenerate({
  required PostgreSQLConnection postgresConnection,
  required String packageName,
  String table_schema = "public",
  bool writeFiles = true,
}) async {
  //hardcode directory because it should really live under lib

  if (!await Directory("lib/generatedDb").exists()) {
    await Directory("lib/generatedDb").create();
  }

  if (!await Directory("lib/generatedDb/models").exists()) {
    await Directory("lib/generatedDb/models").create();
  }

  if (!await Directory("lib/generatedDb/definitions").exists()) {
    await Directory("lib/generatedDb/definitions").create();
  }

  if (!await Directory("lib/generatedDb/services").exists()) {
    await Directory("lib/generatedDb/services").create();
  }

  //get the list of tables from the db
  var tablesRaw = await getTablesRawFromDb(postgresConnection, table_schema);
  var tables = convertRawTablesToTables(tablesRaw);

  //get maps for each template
  var serviceMap = tablesToTemplateMap(tables, packageName, (x) => StringUtils.capitalize(x.name) + "Service.dart");
  var definitionMap = tablesToTemplateMap(tables, packageName, (x) => StringUtils.capitalize(x.name) + "Definition.dart");
  var modelMap = tablesToTemplateMap(tables, packageName, (x) => dePluralise(StringUtils.capitalize(x.name)) + ".dart");

  //process service template
  var serviceTemplater = Templater(templateMain: service_template);
  var serviceOutput = await serviceTemplater.writeFiles(
    "lib/generatedDb/services",
    serviceMap,
    writeFiles: writeFiles,
  );

  //process definition template
  var definitionTemplater = Templater(
    templateMain: definition_template,
    templatesOther: {
      "propertySet_subTemplate": propertySet_subTemplate,
      "column_subTemplate": column_subTemplate,
    },
  );
  var definitionOutput = await definitionTemplater.writeFiles(
    "lib/generatedDb/definitions",
    definitionMap,
    writeFiles: writeFiles,
  );

  //process model template
  var modelTemplater = Templater(
    templateMain: model_template,
    templatesOther: {
      "modelParameters_subTemplate": modelParameters_subTemplate,
    },
  );
  var modelOutput = //
      await modelTemplater.writeFiles(
    "lib/generatedDb/models",
    modelMap,
    writeFiles: writeFiles,
  );

  return [...serviceOutput, ...definitionOutput, ...modelOutput];
}
