import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  Future<Database> initDB() async{
    String path = await getDatabasesPath();
    String dbPath = join(path, 'pacote.db');
    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );
    return db;
  }

  FutureOr<void> onCreate(Database db, int version) async{
    String sql =
        "CREATE TABLE CARD (nome INTEGER PRIMARY KEY AUTOINCREMENT, idade varchar(100), dataNascimento varchar(100), sexo varchar(100), TMental varchar(100, TipoTMental varchar(100));";
    await db.execute(sql);


  }
}