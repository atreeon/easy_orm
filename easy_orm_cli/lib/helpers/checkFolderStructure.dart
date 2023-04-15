import 'dart:io';

import 'package:easy_orm_cli/util/logger.dart';

Future<bool> checkFolderStructure() async {
  if (!File("pubspec.yaml").existsSync()) {
    Logger.error(
        'pubspec.yaml file not found, you must run this command from the root of your Dart/Flutter project');
    print(Directory.current.path);
    var dir = Directory.current;
    var entities = await dir.list().toList();
    print(entities.join(","));
    return false;
  }

  if (!Directory("lib").existsSync()) {
    Logger.error(
        'lib folder not found, you must run this command from the root of your Dart/Flutter project');
    print(Directory.current.path);
    var dir = Directory.current;
    var entities = await dir.list().toList();
    print(entities.join(","));
    return false;
  }
  return true;
}
