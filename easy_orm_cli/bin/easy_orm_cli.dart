import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:easy_orm_engine/dbConnection/getPostgresConnection.dart';
import 'package:colorize/colorize.dart';
import 'package:postgrest_cli/generator.dart';
import 'package:postgrest_cli/util/command_line_tools.dart';
import 'package:postgrest_cli/util/internal_error.dart';
import 'package:postgrest_cli/util/version.dart';

const cmdGenerate = 'generate';
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

  // "generate" command
  var generateParser = ArgParser();
  generateParser.addOption('host', help: 'host name');
  generateParser.addOption('port', help: 'port name');
  generateParser.addOption('db', help: 'database name');
  generateParser.addOption('username', abbr: 'u', help: 'username');
  generateParser.addOption('password', abbr: 'p', help: 'password');
  generateParser.addOption('schema', help: 'schema name');
  generateParser.addOption('package', help: 'package name');
  parser.addCommand(cmdGenerate, generateParser);

  ArgResults results;
  try {
    results = parser.parse(args);
  } catch (e) {
    _printUsage(parser);
    return;
  }

  if (results.command != null) {
    // Version command.
    if (results.command!.name == cmdVersion) {
      printVersion();
      return;
    }

    // Generate command.
    if (results.command!.name == cmdGenerate) {
      String? host = results.command!['host'];
      int? port = int.tryParse(results.command!['port']);
      String? db = results.command!['db'];
      String? username = results.command!['username'];
      String? password = results.command!['password'];
      String? schema = results.command!['schema'];
      String? package = results.command!['package'];

      if ([host, port, db, username, password, package].any((element) => element == null)) {
        print("host, port, db, username, password and package are all required, see help");
        return;
      }

      if (!await Directory("lib").exists()) {
        print('lib folder must exist');
        return;
      }

      await performGenerate(
        postgresConnection: await getPostgresConnection(
          host: host!,
          port: port!,
          db: db!,
          username: username!,
          password: password!,
        ),
        packageName: package!,
        table_schema: schema ?? "public",
      );

      print('Done.');

      return;
    }
  }

  _printUsage(parser);
}

void _printUsage(ArgParser parser) {
  print('${Colorize('Usage:')..bold()} xyz <command> [arguments]\n');
  print('');
  print('${Colorize('COMMANDS')..bold()}');
  print('');
  _printCommandUsage(
    cmdVersion,
    'Prints the version.',
  );
  _printCommandUsage(
    cmdGenerate,
    'Generates the database code.',
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
