import 'dart:io';

import 'package:easy_orm_cli/helpers/convertRawTablesToTables.dart';
import 'package:easy_orm_cli/helpers/convertTablesToDbMap.dart';
import 'package:easy_orm_cli/helpers/convertTablesToTemplateMap.dart';
import 'package:easy_orm_cli/helpers/getTablesRawFromDb.dart';
import 'package:easy_orm_cli/templates/column_subTemplate.dart';
import 'package:easy_orm_cli/templates/db_importStatement_template.dart';
import 'package:easy_orm_cli/templates/db_tableName_template.dart';
import 'package:easy_orm_cli/templates/db_template.dart';
import 'package:easy_orm_cli/templates/definition_template.dart';
import 'package:easy_orm_cli/templates/modelParameters_subTemplate.dart';
import 'package:easy_orm_cli/templates/model_template.dart';
import 'package:easy_orm_cli/templates/propertySet_subTemplate.dart';
import 'package:postgres/postgres.dart';
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

  if (!await Directory("lib/generatedDb/db").exists()) {
    await Directory("lib/generatedDb/db").create();
  }

  // if (!await Directory("lib/generatedDb/services").exists()) {
  //   await Directory("lib/generatedDb/services").create();
  // }

  //get the list of tables from the db
  var tablesRaw = await getTablesRawFromDb(postgresConnection, table_schema);
  var tables = convertRawTablesToTables(tablesRaw);

  //get maps for each template
  //We've removed service file from the generated output files
  // var serviceMap = convertTablesToTemplateMap(tables, packageName, (x) => StringUtils.capitalize(x.name) + "Service.dart");
  var definitionMap = convertTablesToTemplateMap(tables, packageName, (x) => x.definitionName + ".dart");
  var modelMap = convertTablesToTemplateMap(tables, packageName, (x) => x.modelName + ".dart");
  var dbMap = convertTablesToDbMap(tables, packageName);

  // //process service template
  // var serviceTemplater = Templater(templateMain: service_template);
  // var serviceOutput = await serviceTemplater.writeFiles(
  //   "lib/generatedDb/services",
  //   serviceMap,
  //   writeFiles: writeFiles,
  // );

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

  //process db template
  var dbTemplater = Templater(
    templateMain: db_template,
    templatesOther: {
      "importStatementTemplate": db_importStatement_template,
      "tableNameTemplate": db_table_template,
    },
  );
  var dbOutput = //
      await dbTemplater.writeFiles(
    "lib/generatedDb/db",
    dbMap,
    writeFiles: writeFiles,
  );

  return [
    // ...serviceOutput,
    ...definitionOutput,
    ...modelOutput,
    ...dbOutput,
  ];
}
