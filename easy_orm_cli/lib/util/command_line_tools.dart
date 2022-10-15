import 'dart:async';
import 'dart:io';

import 'windows.dart';

class CommandLineTools {
  static Future<bool> existsCommand(String command) async {
    if (Platform.isWindows) {
      var commandPath = WindowsUtil.commandPath(command);
      return commandPath != null;
    } else {
      var result = await Process.run('which', [command]);
      return result.exitCode == 0;
    }
  }
}
