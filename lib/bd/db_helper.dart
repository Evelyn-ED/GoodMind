import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:prova/domain/pacote_informacao.dart';


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
    String sql = '''
     CREATE TABLE PACOTE (
       id INTEGER PRIMARY KEY,
       titulo1 VARCHAR(100),
       descricao VARCHAR(255),
       urlImage VARCHAR(255)
     );
   ''';
    await db.execute(sql);


    sql = '''
     INSERT INTO PACOTE (id, titulo1, descricao, urlImage)
     VALUES
       (1, 'Ansiedade', 'Clique aqui, e saiba mais informações.', 'https://zenklub.com.br/blog/wp-content/uploads/2022/07/iStock-1336501604-min.png'),
       (2, 'Depressão', 'Clique aqui, e saiba mais informações.', 'https://th.bing.com/th/id/OIP.ZOIIsaHer4FbNzBCDT_JxwAAAA?w=433&h=352&rs=1&pid=ImgDetMain'),
       (3, 'Síndrome do Pânico', 'Clique aqui, e saiba mais informações.', 'https://th.bing.com/th/id/R.bd0e68de2c7a93cbc842325e0f13f054?rik=vgUJou1xZWI%2flw&riu=http%3a%2f%2fmedicine.net%2fuploads%2f20240713%2fbd0e68de2c7a93cbc842325e0f13f054.file&ehk=SWeVBIfT6nkCpM%2fTA9aRkDsButd28hVaAs8lgrSlfII%3d&risl=&pid=ImgRaw&r=0');
   ''';
    await db.execute(sql);


  }


}
