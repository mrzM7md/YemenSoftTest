import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'cache_helper.dart';

class SqlDb {

  static Database? _db;

  Future<Database?> get db async {
    if(_db == null){
      _db = await initialDb();
      return _db;
    }
    else {
      return _db;
    }
  }

  Future<Database> initialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'yemen_soft.db');
    Database myDb = await openDatabase(path, onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return myDb;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async{
    print("--------------- DATABASE UPGRADED ---------------");
  }

  void _onCreate(Database db, int version) async {
    await db.execute("""
        CREATE TABLE 'orders' (
        
        BILL_TYPE VARCHAR(100),
        BILL_AMT VARCHAR(100),
        BILL_DATE VARCHAR(100),
        DLVRY_STATUS_FLG VARCHAR(100),
        BILL_NO VARCHAR(100),
        BILL_SRL VARCHAR(100)
        );
    """);
    // await CacheHelper.setData(key: 'dateAppInstalled', value: DateTime.now().toString());

    print("--------------- DATABASE CREATED ---------------");
  }

  Future<List<Map>> readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);

    return response;
  }

  Future<int> insertData(String sql) async {
    Database? mydb = await db;

    int? response;
    await mydb?.transaction ((txn) async {
      response = await txn.rawInsert(sql);
      return null;
    });

    return response!;
  }


  Future<int> updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }


  Future<int> clearTableData(String tableName) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete('DELETE FROM "$tableName"');
    return response;
  }

}