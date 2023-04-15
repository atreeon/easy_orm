import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:colorize/colorize.dart';
import 'package:easy_orm_cli/helpers/checkFolderStructure.dart';
import 'package:easy_orm_cli/helpers/convertRawTablesToTables.dart';
import 'package:easy_orm_cli/helpers/filterTables.dart';
import 'package:easy_orm_cli/helpers/getTablesRawFromDb.dart';
import 'package:easy_orm_cli/util/logger.dart';

import 'easy_orm_cli.dart';

class CheckCommand extends Command<void> {
  @override
  final name = 'check';

  @override
  final description = 'Check the database schema';

  CheckCommand() {
    argParser.addOption('host', help: 'host name');
    argParser.addOption('port', help: 'port name');
    argParser.addOption('db', help: 'database name');
    argParser.addOption('username', abbr: 'u', help: 'username');
    argParser.addOption('password', abbr: 'p', help: 'password');
    argParser.addOption('schema', help: 'schema name');
    argParser.addOption('package', help: 'package name');
    argParser.addOption('config', help: 'config file path');
  }

  @override
  Future<void> run() async {
    final options = await getOptions(argResults!);
    final cn = options.postgresConnection;

    await checkFolderStructure();

    try {
      Logger.status("Getting schema from database...");
      var tablesRaw = await getTablesRawFromDb(cn, options.schema);
      var tables1 = convertRawTablesToTables(tablesRaw);
      var tables = filterTables(tables1, options);
      final s = StringBuffer();
      s.writeln("Tables to be generated:");
      for (final t in tables) {
        s.writeln("    ${Colorize(t.tableName).blue()}");
        for (final c in t.columns) {
          s.writeln("    * ${Colorize(c.columnName).green()}");
        }
      }
      Logger.info(s.toString());
      final excludedTables = options.exclude.entries
          .where((e) => e.value == null)
          .map((e) => e.key);
      final excludedColumns = options.exclude.entries
          .where((e) => e.value != null)
          .expand((e) => e.value!.map((c) => e.key + "." + c));
      if (excludedTables.isNotEmpty) {
        Logger.info("Tables excluded: " + excludedTables.join(", "));
      }
      if (excludedColumns.isNotEmpty) {
        Logger.info("Columns excluded: " + excludedColumns.join(", "));
      }
    } on SocketException catch (e) {
      if (e.osError?.errorCode == 61) {
        Logger.error("Connection refused, is db accessible?");
      } else {
        Logger.error("Socket error: ${e.osError?.errorCode}");
      }
      exit(1);
    } catch (e) {
      Logger.error("Error: $e");
      exit(1);
    }
    return;
  }
}
