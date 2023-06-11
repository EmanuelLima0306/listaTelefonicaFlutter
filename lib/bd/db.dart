import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Database> openDataBae() async {
  sqfliteFfiInit();
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, "contactos.db");

  final database = openDatabase(
    join(await getDatabasesPath(), 'contactos.db'),
    onCreate: (db, version) {
      return db.execute(
        _getQuery(),
      );
    },
    version: 1,
  );

  return database;
}

_getQuery() {
  String query =
      "CREATE TABLE IF NOT EXISTS contactos(id INTEGER PRIMARY KEY AUTOINCREMENT, image VARCHAR(255), name VARCHAR(255), phoneNumber VARCHAR(255))";
  return query;
}
