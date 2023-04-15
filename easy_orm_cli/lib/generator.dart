import 'dart:io';

import 'package:easy_orm_cli/helpers/convertRawTablesToTables.dart';
import 'package:easy_orm_cli/helpers/convertTablesToDbMap.dart';
import 'package:easy_orm_cli/helpers/convertTablesToTemplateMap.dart';
import 'package:easy_orm_cli/helpers/filterTables.dart';
import 'package:easy_orm_cli/helpers/generator_options.dart';
import 'package:easy_orm_cli/helpers/getTablesRawFromDb.dart';
import 'package:easy_orm_cli/templates/column_subTemplate.dart';
import 'package:easy_orm_cli/templates/db_importStatement_template.dart';
import 'package:easy_orm_cli/templates/db_tableName_template.dart';
import 'package:easy_orm_cli/templates/db_template.dart';
import 'package:easy_orm_cli/templates/definition_template.dart';
import 'package:easy_orm_cli/templates/modelParameters_subTemplate.dart';
import 'package:easy_orm_cli/templates/model_template.dart';
import 'package:easy_orm_cli/templates/propertySet_subTemplate.dart';
import 'package:easy_orm_cli/util/logger.dart';
import 'package:templater_atreeon/templater_atreeon.dart';

Future<List<String>> performGenerate(
  GeneratorOptions options, {
  bool writeFiles = true,
}) async {
  //hardcode directory because it should really live under lib

  final rootGeneratedDir = Directory("lib/generatedDb");
  if (rootGeneratedDir.existsSync()) {
    await rootGeneratedDir.delete(recursive: true);
  }
  await Future.wait([
    rootGeneratedDir,
    Directory("lib/generatedDb/models"),
    Directory("lib/generatedDb/definitions"),
    Directory("lib/generatedDb/db"),
    Directory("lib/generatedDb/services"),
  ].map((dir) async {
    if (!dir.existsSync()) {
      await dir.create();
    }
  }));

  // if (!await Directory("lib/generatedDb/services").exists()) {
  //   await Directory("lib/generatedDb/services").create();
  // }

  //get the list of tables from the db
  Logger.status("Getting schema from database...");
  var tablesRaw =
      await getTablesRawFromDb(options.postgresConnection, options.schema);
  var tables1 = convertRawTablesToTables(tablesRaw);
  var tables = filterTables(tables1, options);

  //get maps for each template
  //We've removed service file from the generated output files
  // var serviceMap = convertTablesToTemplateMap(tables, packageName, (x) => StringUtils.capitalize(x.name) + "Service.dart");
  var definitionMap = convertTablesToTemplateMap(
      tables, options, (x) => x.definitionName + ".dart");
  var modelMap =
      convertTablesToTemplateMap(tables, options, (x) => x.modelName + ".dart");
  var dbMap = convertTablesToDbMap(tables, options);

  // //process service template
  // var serviceTemplater = Templater(templateMain: service_template);
  // var serviceOutput = await serviceTemplater.writeFiles(
  //   "lib/generatedDb/services",
  //   serviceMap,
  //   writeFiles: writeFiles,
  // );

  Logger.status("Writing files...");
  final output = <String>[];
  //process definition template
  if (!options.only_generate_models) {
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
    output.addAll(definitionOutput);
  }

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
  output.addAll(modelOutput);

  //process db template
  if (!options.only_generate_models) {
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
    output.addAll(dbOutput);
  }

  return output;
}
