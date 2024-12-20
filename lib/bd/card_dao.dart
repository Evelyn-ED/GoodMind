import 'package:myapp/db/dbHelper.dart';
import 'package:myapp/domain/cardAnamnese.dart';
import 'package:myapp/db/card_dao.dart';
import 'package:sqflite/sqflite.dart';

class CardDao{
  saveCard(CardAnamnese card) async {
    Database database = await DBHelper().initDB();
    database.insert('CARD', card.toJson());
  }

  listCards() async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM CARD;';
    var result = await database.rawQuery(sql);

    List<CardAnamnese> list = [];
    for(var json in result){
      CardAnamnese card = CardAnamnese.fromJson(json);
      list.add(card);
    }

    return list;
  }

}
