import 'package:sqflite/sqflite.dart';
import 'package:users/db/database_connection.dart';

class UserRepository {
  late DatabaseConnection _databaseConnection;

  UserRepository() {
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  String table = "users";

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  Future<int?> insertData(Map<String, dynamic> data) async {
    var connection = await database;
    return await connection?.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>?> readData() async {
    var connection = await database;
    return await connection?.query(table);
  }

  Future<List<Map<String, dynamic>>?> readDataById(int userId) async {
    var connection = await database;
    return await connection?.query(table, where: 'id = ?', whereArgs: [userId]);
  }

  Future<int?> updateData(Map<String, dynamic> data) async {
    var connection = await database;
    return await connection?.update(table, data, where: 'id = ?', whereArgs: [data['id']]);
  }

  Future<int?> deleteDataById(int userId) async {
    var connection = await database;
    return await connection?.delete(table, where: 'id = ?', whereArgs: [userId]);
  }
}
