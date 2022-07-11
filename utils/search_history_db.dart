import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:takfoodowner/models/search_history_model.dart';
class SearchHistoryDb{
  Future<Database> openDb()async{
    return openDatabase(
      join(await getDatabasesPath(),'history_search_db'),
      onCreate: (db,version){
        return db.execute(
          'CREATE TABLE history_search_db (id INTEGER , title TEXT)',
        );
      },
      version: 1,
    );
  }
  Future<void> insertToDb(HistorySearchModel model)async{
    final db=await openDb();
    print("insert to database is ${model.title}");
    await db.insert(
        'history_search_db',
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }
  Future<List<HistorySearchModel>> getList()async{
    final db=await openDb();
    final List<Map<String,dynamic>> maps=await db.query('history_search_db');
    return List.generate(maps.length, (index) {
      return HistorySearchModel(maps[index]["id"], maps[index]["title"]);
    });
  }
  Future<void> deleteOfDatabase(int id)async{
    final db=await openDb();
    await db.delete(
        'history_search_db',
        where: 'id = ?',
        whereArgs: [id]
    );
  }
}