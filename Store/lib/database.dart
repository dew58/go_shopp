import'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Users{
  Database? database;

  //creat the data base
  creatdb() async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'users.db');
    this.database = await openDatabase(path, version: 1,
        onCreate: ( Database db, int version) async {
          await db.execute(
              'CREATE TABLE Test (id INTEGER PRIMARY KEY, user TEXT, )');
        });
  }
  insert(String name) async {
    await database!.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO Test(user) VALUES("$name")');
      print("we add $name to db");
    });
  }
  getdata() async{
    List<Map> name = await this.database!.rawQuery('SELECT * FROM user');
  }
}