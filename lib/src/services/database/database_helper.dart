import 'package:password_manager/src/model/account/account.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _dbName = 'vault.db';
  static const _dbVersion = 1;
  static const _tableName = 'accounts';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _db;
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  _initDatabase() async {
    String path = await getDatabasesPath();

    return openDatabase(join(path, _dbName),
        onCreate: (database, version) async {
      await database.execute(
          'CREATE TABLE accounts(id INTEGER PRIMARY KEY, name TEXT NOT NULL, username TEXT, password TEXT NOT NULL)');
    }, version: _dbVersion);
  }

  Future<int> insertAccount(Account _account) async {
    int res = 0;
    Database db = await instance.database;
    res = await db.insert(_tableName, _account.toMap());
    return res;
  }

  Future<List<Account>> getAccounts({String? search}) async {
    search = search ?? '';
    final List<Map<String, dynamic>> query = await _db!.query(_tableName,
        where: 'name LIKE ?',
        whereArgs: ['%$search%'],
        orderBy: 'LOWER(name) ASC, LOWER(username) ASC, LOWER(password)');

    return List.generate(
        query.length,
        (index) => Account(
              query[index]['name'],
              query[index]['username'],
              query[index]['password'],
              query[index]['id'],
            ));
  }

  Future<int> deleteAccount(int id) async {
    int res = 0;
    Database db = await instance.database;
    res = await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
    return res;
  }
}
