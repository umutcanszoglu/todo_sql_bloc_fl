import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String dbName = "toDos.sqlite";

  static Future<Database> dbConnection() async {
    String dbPath = join(await getDatabasesPath(), dbName);

    if (await databaseExists(dbPath)) {
      print("Db exist.");
    } else {
      ByteData data = await rootBundle.load("database/$dbName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes, flush: true);
      print("Db copied.");
    }

    return openDatabase(dbPath);
  }
}
