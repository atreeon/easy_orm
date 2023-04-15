import 'package:colorize/colorize.dart';

class Logger {
  const Logger._();

  static void info(String message) {
    print('[${Colorize('i')..green()}] $message');
  }

  static void error(String message) {
    print('[${Colorize('!')..red()}] ${Colorize(message)..red()}');
  }

  static void warning(String message) {
    print('[${Colorize('!')..yellow()}] $message');
  }

  static void success(String message) {
    print('[${Colorize('✓')..green()}] $message');
  }

  static void status(String message) {
    print('[${Colorize('*')..blue()}] $message');
  }
}
