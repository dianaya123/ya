import 'dart:io';
import 'package:academix_polnep/views/login/login.dart';
import 'package:academix_polnep/views/login/pilihan.dart';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/session.txt');
}

Future<File> writeSession(String? session) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString('$session');
}

Future<String?> readSession() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return (contents);
  } catch (e) {
    // If encountering an error, return this
    return "You Fucked Up";
  }
}
