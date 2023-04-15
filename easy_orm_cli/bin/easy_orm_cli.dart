import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:colorize/colorize.dart';
import 'package:easy_orm_cli/helpers/generator_options.dart';
import 'package:easy_orm_cli/util/internal_error.dart';
import 'package:easy_orm_cli/util/logger.dart';
import 'package:yaml/yaml.dart';

import 'check.dart';
import 'generate.dart';
import 'version.dart';

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
  var cmdRunner = CommandRunner("easy_orm_cli", "Easy ORM CLI");

  cmdRunner.addCommand(GenerateCommand());
  cmdRunner.addCommand(CheckCommand());
  cmdRunner.addCommand(VersionCommand());

  try {
    await cmdRunner.run(args);
  } catch (e, s) {
    Logger.error("An error occurred: $e\n$s");
    exit(1);
  }
}

Future<GeneratorOptions> getOptions(ArgResults argResults) async {
  GeneratorOptions options;
  if (argResults.wasParsed('config')) {
    try {
      var config = File(argResults['config']);
      if (config.existsSync()) {
        final configContent = await config.readAsString();
        // parse with yaml
        final parsed = loadYaml(configContent);
        if (parsed is YamlMap) {
          final map = Map<String, dynamic>.fromIterables(
            parsed.keys.cast(),
            parsed.values,
          );
          options = GeneratorOptions.fromJson(map);
        } else {
          Logger.error("Config file is not a valid yaml file");
          exit(1);
        }
      } else {
        Logger.error("Config file not found at ${config.path}");
        exit(1);
      }
    } catch (e) {
      Logger.error("Failed to parse config file: $e");
      exit(1);
    }
  } else {
    dynamic getArg(String name) {
      if (argResults.wasParsed(name)) {
        return argResults[name];
      } else {
        Logger.error(
            "Missing argument: ${Colorize(name)..bold()}. Provide it or use ${Colorize('--config')..bold()} to use a config file.");
        exit(1);
      }
    }

    try {
      options = GeneratorOptions(
        host: getArg('host'),
        port: int.parse(getArg('port')),
        db: getArg('db'),
        username: getArg('username'),
        password: getArg('password'),
        schema: getArg('schema'),
        package: getArg('package'),
      );
      if (argResults.wasParsed('build-runner')) {
        options = options.copyWith(
          build_runner: argResults['build-runner'],
        );
      }
    } catch (e) {
      print(Colorize("Failed to parse options: $e")..red());
      exit(1);
    }
  }
  return options;
}
