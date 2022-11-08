import 'dart:io';

Future<bool> checkFolderStructure() async {
  if (!await File("pubspec.yaml").exists() || !await File("pubspec.yaml").exists()) {
    print('pubspec.yaml file not found, must be a dart application');
    print(Directory.current.path);
    var dir = Directory.current;
    var entities = await dir.list().toList();
    print(entities.join(","));
    return false;
  }

  if (!await Directory("lib").exists()) {
    print('lib folder must exist');
    print(Directory.current.path);
    var dir = Directory.current;
    var entities = await dir.list().toList();
    print(entities.join(","));
    print('lib folder must exist');
    return false;
  }
  return true;
}
