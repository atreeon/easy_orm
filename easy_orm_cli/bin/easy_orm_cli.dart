import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:colorize/colorize.dart';
import 'package:easy_orm_cli/generator.dart';
import 'package:easy_orm_cli/helpers/checkFolderStructure.dart';
import 'package:easy_orm_cli/helpers/convertRawTablesToTables.dart';
import 'package:easy_orm_cli/helpers/getTablesRawFromDb.dart';
import 'package:easy_orm_cli/util/command_line_tools.dart';
import 'package:easy_orm_cli/util/internal_error.dart';
import 'package:easy_orm_cli/util/version.dart';
import 'package:easy_orm_postgres/dbConnection/getPostgresConnectionFromArgs.dart';

const cmdGenerate = 'generate';
const cmdCheck = 'check';
const cmdVersion = 'version';

// final runModes = <String>['development', 'staging', 'production'];

void main(List<String> args) async {
  await runZonedGuarded(
    () async {
      try {
        await _main(args);
      } catch (error, stackTrace) {
        // Last resort error handling.
        printInternalError(error, stackTrace);
      }
    },
    (error, stackTrace) {
      printInternalError(error, stackTrace);
    },
  );
}

Future<void> _main(List<String> args) async {
  // Check that required tools are installed
  if (!await CommandLineTools.existsCommand('dart')) {
    print('Failed to run generate. You need to have dart installed and in your \$PATH');
    return;
  }

  var parser = ArgParser();

  // "version" command
  var versionParser = ArgParser();
  parser.addCommand(cmdVersion, versionParser);

  // "check" command
  var checkParser = ArgParser();
  checkParser.addOption('host', help: 'host name', mandatory: true);
  checkParser.addOption('port', help: 'port name', mandatory: true);
  checkParser.addOption('db', help: 'database name', mandatory: true);
  checkParser.addOption('username', abbr: 'u', help: 'username', mandatory: true);
  checkParser.addOption('password', abbr: 'p', help: 'password', mandatory: true);
  checkParser.addOption('schema', help: 'schema name', mandatory: true);
  checkParser.addOption('package', help: 'package name', mandatory: true);
  parser.addCommand(cmdCheck, checkParser);

  // "generate" command
  var generateParser = ArgParser();
  generateParser.addOption('host', help: 'host name', mandatory: true);
  generateParser.addOption('port', help: 'port name', mandatory: true);
  generateParser.addOption('db', help: 'database name', mandatory: true);
  generateParser.addOption('username', abbr: 'u', help: 'username', mandatory: true);
  generateParser.addOption('password', abbr: 'p', help: 'password', mandatory: true);
  generateParser.addOption('schema', help: 'schema name', mandatory: true);
  generateParser.addOption('package', help: 'package name', mandatory: true);
  parser.addCommand(cmdGenerate, generateParser);

  ArgResults argResults;
  try {
    argResults = parser.parse(args);
  } catch (e) {
    _printUsage(parser);
    return;
  }

  if (argResults.command != null) {
    // Version command.
    if (argResults.command!.name == cmdVersion) {
      printVersion();
      return;
    }

    // check
    if (argResults.command!.name == cmdCheck) {
      var cn = await getPostgresConnectionFromArgs(argResults);
      var table_schema = argResults.command!['schema'];

      checkFolderStructure();

      try {
        var tablesRaw = await getTablesRawFromDb(cn, table_schema);
        var tables = convertRawTablesToTables(tablesRaw);
        var result = tables.map((e) => e.name).join(", ");

        print("tables to be created:");
        print(result);
      } on SocketException catch (e) {
        if (e.osError?.errorCode == 61) {
          print("connection refused, is db accessible?");
        }
        print("db connection error");
        return;
      }
      return;
    }

    // Generate command.
    if (argResults.command!.name == cmdGenerate) {
      print('checking...');

      if (!await checkFolderStructure()) //
        return;

      var port = int.tryParse(argResults.command!['port']);
      if (port == null) //
        throw Exception("port needs to be an integer");

      print('generating...');

      await performGenerate(
        postgresConnection: await getPostgresConnectionFromArgs(argResults),
        packageName: argResults.command!['package'],
        table_schema: argResults.command!['schema'],
      );

      print('building...');

      var result = await Process.runSync(
        'dart',
        ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
        workingDirectory: Directory.current.path,
      );

      print(result.stderr.toString());
      print(result.stdout.toString());

      print('Done.');

      return;
    }
  }

  _printUsage(parser);
}

void _printUsage(ArgParser parser) {
  print('${Colorize('Usage:')..bold()} easy_orm_cli <command> [arguments]\n');
  print('');
  print('${Colorize('COMMANDS')..bold()}');
  print('');
  _printCommandUsage(
    cmdVersion,
    'Prints the version.',
  );
  _printCommandUsage(
    cmdGenerate,
    'Generates the database code.  All arguments are mandatory. \neasy_orm_cli generate --host localhost --port 5433 --db postgres -u postgres -p postgres --schema public --package example',
    parser.commands[cmdGenerate]!,
  );
}

void _printCommandUsage(String name, String descr, [ArgParser? parser, bool last = false]) {
  print('${Colorize('$name:')..bold()} $descr');
  if (parser != null) {
    print('');
    print(parser.usage);
    print('');
  }

  if (!last) {
    print('');
  }
}
