// import 'dart:io';
//
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
//
// class DatabaseHelper {
//
//   static const _databaseName = "MyDatabase.db";
//   static const _databaseVersion = 1;
//
//   static const table = 'my_table';
//
//   static const ID = 'id';
//   static const name = 'name';
//   static const email = 'email';
//   static const phone = 'phone';
//   static const username = 'username';
//   static const password = 'password';
//   static const address = 'address';
//
//
//   late Database _db;
//
//   Future<Database> get database async {
//     if (_db != null)
//       return _db;
//     _db = await initDB();
//     return _db;
//   }
//
//   initDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, "$_databaseName");
//     return await openDatabase(path, version: 1, onOpen: (db) {
//     }, onCreate: (Database db, int version) async {
//       await db.execute('''
//       CREATE TABLE my_table' (
//           $ID INTEGER PRIMARY KEY AUTOINCREMENT,
//           $name TEXT,
//           $email TEXT,
//           $phone INTEGER,
//           $username TEXT,
//           $password TEXT,
//           $address TEXT
//           )
//       ''');
//     });
//   }
//
//   Future<int> insert(Map<String, dynamic> row) async {
//     return await _db.insert("my_table'", row);
//   }
//
//   Future<List<Map<String, dynamic>>> queryAllRows() async {
//     return await _db.query("my_table'");
//   }
//
//
//   // Future<int> queryRowCount() async {
//   //   final results = await _db.rawQuery('SELECT COUNT(*) FROM $table');
//   //   return Sqflite.firstIntValue(results) ?? 0;
//   // }
//   //
//   //
//   // Future<int> update(Map<String, dynamic> row) async {
//   //   int id = row[ID];
//   //   return await _db.update(
//   //     table,
//   //     row,
//   //     where: '$ID = ?',
//   //     whereArgs: [ID],
//   //   );
//   // }
//   //
//   //
//   // Future<int> delete(int id) async {
//   //   return await _db.delete(
//   //     table,
//   //     where: '$ID = ?',
//   //     whereArgs: [ID],
//   //   );
//   // }
//
//
// }


import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = 'myDatabase.db';
  static final _databaseVersion = 1;

  static final table = 'myTable';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnemail = 'email';
  static final columnphone = 'phone';
  static final columnusername = 'username';
  static final columnpassword = 'password';
  static final columnaddress = 'address';

  static  Database? _database;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER,
            $columnName TEXT NOT NULL,
            $columnemail Text UNIQUE,
            $columnphone INTEGER,
            $columnusername TEXT,
            $columnpassword TEXT,
            $columnaddress TEXT
          );
          ''');
  }

  Future<int?> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db?.insert(table, row);
  }

  Future<List<Map<String, dynamic>>?> queryAll() async {
    Database? db = await instance.database;
    return await db?.query(table);
  }

  // Future<int> update(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   int id = row[columnId];
  //   return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  // }

  // Future<int> delete(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  // }
}
