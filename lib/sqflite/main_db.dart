import 'package:sqflite/sqflite.dart';

class DataBaseClass {

  static late Database db;

  static Future<void> initializeDatabase() async {
    db = await openDatabase(

        'localStorage.db',
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE profile (id INTEGER PRIMARY KEY, name TEXT, email TEXT,phone REAL,gender TEXT,dob TEXT,maritalStatus TEXT,occupation TEXT,tradingXp TEXT,gir TEXT,address TEXT)');
        });
  }
  
  static Future<void> getDataFromDB() async {
    final data = await db.rawQuery("SELECT * FROM profile");
    print(data);

  }


}