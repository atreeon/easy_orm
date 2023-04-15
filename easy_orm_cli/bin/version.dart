import 'package:args/command_runner.dart';
import 'package:easy_orm_cli/util/version.dart';

class VersionCommand extends Command {
  @override
  final name = 'version';

  @override
  final description = 'Print the current version of easy_orm_cli.';

  @override
  Future<void> run() async {
    printVersion();
  }
}
