import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:easy_orm_cli/generator.dart';
import 'package:easy_orm_cli/helpers/checkFolderStructure.dart';
import 'package:easy_orm_cli/util/logger.dart';

import 'easy_orm_cli.dart';

class GenerateCommand extends Command<void> {
  @override
  final name = 'generate';

  @override
  final description = 'Generate a new Easy ORM model';

  GenerateCommand() {
    argParser.addOption('host', help: 'host name');
    argParser.addOption('port', help: 'port name');
    argParser.addOption('db', help: 'database name');
    argParser.addOption('username', abbr: 'u', help: 'username');
    argParser.addOption('password', abbr: 'p', help: 'password');
    argParser.addOption('schema', help: 'schema name');
    argParser.addOption('package', help: 'package name');
    argParser.addFlag('build-runner',
        help: 'run build_runner after generation',
        defaultsTo: true,
        negatable: true);
    argParser.addOption('config', help: 'config file path');
  }

  @override
  Future<void> run() async {
    final options = await getOptions(argResults!);
    Logger.status('Checking folder structure...');

    if (!await checkFolderStructure()) {
      exit(1);
    }

    Logger.status('Generating models...');

    await performGenerate(options);

    if (options.build_runner) {
      Logger.status('Running build_runner...');

      final process = await Process.start(
        'dart',
        ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
        workingDirectory: Directory.current.path,
      );
      stdout.addStream(process.stdout);
      stderr.addStream(process.stderr);

      final exitCode = await process.exitCode;
      if (exitCode != 0) {
        Logger.error('build_runner failed with exit code $exitCode');
        exit(1);
      }
    } else {
      Logger.status('Skipping build_runner...');
    }

    Logger.success('Done.');
    exit(0);
  }
}
