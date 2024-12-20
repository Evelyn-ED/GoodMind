import 'package:untitled9/bd/db_helperCadast.dart';
import 'package:untitled9/domain/Cadastro.dart';
import 'package:sqflite/sqflite.dart';


class CadastroDao {
  listarItens() async {
    salvarCadastro(Cadastro cadastro) async {
      Database database = await DBHelper().initDB();
      await database.insert('Cadastros', cadastro.toJson());
    }


    listarItens() async {
      Database database = await DBHelper().initDB();


      String sql = 'SELECT * FROM CADASTROS;';
      var result = await database.rawQuery(sql);


      List<Cadastro> lista = [];
      for (var json in result) {
        Cadastro cadastro = Cadastro.fromJson(json);
        lista.add(cadastro);
      }
      return lista;
    }


  }


  salvarCadastro(Cadastro cadastro) {}
}
