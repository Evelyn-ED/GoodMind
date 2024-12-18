import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'user.db');
    Database db = await openDatabase(
      dbPath,
      version: 3,
      onCreate: onCreate,
    );

    return db;
  }

  FutureOr<void> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE CADASTRO (username varchar(100), email varchar(100) PRIMARY KEY, password varchar(100))';
    await db.execute(sql);

    sql =
    "INSERT INTO CADASTRO (username, email, password) VALUES ('Francielle Alves', 'fas23@aluno.ifal.edu.br', '123456');";
    await db.execute(sql);

  }
}