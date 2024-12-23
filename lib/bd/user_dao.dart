import 'package:GoodMind/bd/db_helper.dart';
import 'package:GoodMind/domain/User.dart';
import 'package:';
import 'package:sqflite/sqflite.dart';

class UserDao {
  saveUser(User user) async {
    Database database = await DBHelper().initDB();
    database.insert('CADASTRO', user.toJson());
  }

  autenticar(String email, String password) async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM CADASTRO '
        'WHERE email = ? '
        'AND password = ?;';

    var result = await database.rawQuery(sql, [email, password]);

    return result.isNotEmpty;
  }
}