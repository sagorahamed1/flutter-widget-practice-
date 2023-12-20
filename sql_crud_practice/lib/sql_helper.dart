import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT,
    description TEXT,
    createAt TIMESTAMP NOT NULL DEFAULT CREATE_TIMESTAMP,
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
        ""
        "bd_bdcalling.bd",
        version: 1, onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItems(String title, String? description) async{
    final db = await SQLHelper.db();
    final data = {'title': title, 'description' : description};
    final id = await db.insert("items", data);
    return id;
  }

  static Future <List<Map<String ,dynamic>>> getItems()async{
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  static Future <List<Map<String, dynamic>>> getItem(int id)async{
    final db = await SQLHelper.db();
    return db.query("items", where: "id = ?" , whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int id, String title, String? description) async{
    final db = SQLHelper.db();
    final data = {
      "title" : title,
      "description" : description,
      "createAt" : DateTime.now().toString()
    };

    final result = await db.update("items",data, where: "id = ?" , whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async{
    final db = await SQLHelper.db();
    await db.delete("items", where: "id = ?", whereArgs: [id]);
  }
}
