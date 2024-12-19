import 'package:prova/bd/db_helper.dart';
import 'package:prova/domain/comentario.dart';
import 'package:sqflite/sqflite.dart';


class ComentarioDao{
  Future<void>salvarComentario(Comentario comentario) async {
    Database db = await DBHelper().initDB();
    db.insert('COMENTARIO', comentario.toJson());
  }


  listarComentario() async {
    Database database = await DBHelper().initDB();


    String sql = 'SELECT * FROM COMENTARIO;';
    var result = await database.rawQuery(sql);


    List<Comentario> lista = [];
    for (var json in result) {
      Comentario comentario = Comentario.fromJson(json);
      lista.add(comentario);
    }


    return lista;
  }
}


