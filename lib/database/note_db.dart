import 'dart:io';

import 'package:note_app/feature/app/model/note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase {
  final String dbName = "note.db";
  final int dbVersion = 1;
  final String tableName = "notes";
  final String colId = "id";
  final String colTitle = "title";
  final String colNote = "note";
  final String colDate = "date";

  Future<Database> init() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String location = "";
    if (Platform.isIOS) {
      String username = Platform.environment["USER"] ?? "Unknown User";
      if (!(username == "Unknown User")) {
        location = "/User/$username/Documents";
      }
    } else {
      location = appDir.path;
    }
    return openDatabase(
      "$location/$dbName",
      version: dbVersion,
      onCreate: (db, version) async {
        return db.execute(
          "CREATE TABLE IF NOT EXISTS $tableName ("
          "$colId INTEGER PRIMARY KEY AUTOINCREMENT,"
          "$colTitle TEXT,"
          "$colNote TEXT,"
          "$colDate TEXT"
          ")",
        );
      },
    );
  }

  Future<int> insert(NoteModel note) async {
    final db = await init();
    return db.insert(tableName, note.toMap());
  }

  Future<List<NoteModel>> getAll() async {
    final db = await init();
    List<Map<String, dynamic>> list = await db.query(tableName);
    return list.map((e) => NoteModel.fromMap(e)).toList();
  }

  Future<bool> update(NoteModel note) async {
    final db = await init();
    int i = await db.update(
      tableName,
      note.toMap(),
      where: '$colId = ?',
      whereArgs: [note.id],
    );
    return i > 0;
  }
  Future<bool> delete(NoteModel note) async {
    final db = await init();
    int i = await db.delete(tableName,where: '$colId = ?',whereArgs: [note.id]);
    return i > 0;
  }
}
