import 'package:projeto_fran/bancoD/db_helper.dart';
import 'package:projeto_fran/domain/User.dart';
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