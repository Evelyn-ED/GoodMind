import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'pacote.db');
    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );
    return db;
  }


  FutureOr<void> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE CADASTRO (id INTERGER PRIMARY KEY, nome varchar(100), idade INTERGER, datadeinicio varchar(100));';
    await db.execute(sql);


    sql =
    "INSERT INTO CADASTRO ((id, nome, idade, datadeinicio) VALUES (1, 'Maria', 20, '20/10/2035');";
    await db.execute(sql);


    sql =
    "INSERT INTO CADASTRO ((id, nome, idade, datadeinicio) VALUES (1, 'Maria', 20, '20/10/2035');";
    await db.execute(sql);


    sql =
    "INSERT INTO CADASTRO ((id, nome, idade, datadeinicio) VALUES (1, 'Maria', 20, '20/10/2035');";
    await db.execute(sql);
  }
}
