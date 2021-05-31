import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbStudentManager {
  Database _database;

  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(
          join(await getDatabasesPath(), "ss.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(         
           "CREATE TABLE gara(id INTEGER PRIMARY KEY autoincrement, name TEXT, category TEXT, date TEXT, orario TEXT)",
            );
      } );
    }
  }

  Future<int> insertGara(Gara gara) async {
    await openDb();
    return await _database.insert('gara', gara.toMap());
  }

  Future<List<Gara>> getGaraList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('gara');
    return List.generate(maps.length, (i) {
      return Gara(
          id: maps[i]['id'], name: maps[i]['name'], category: maps[i]['category'], date: maps[i]['date'], orario: maps[i]['orario']);
    });
  }

  Future<int> updateGara(Gara gara) async {
    await openDb();    
    return await _database.update('gara', gara.toMap(),
        where: "id = ?", whereArgs: [gara.id]);
  }

  Future<void> deleteGara(int id) async {
    await openDb();
    await _database.delete(
      'gara',
        where: "id = ?", whereArgs: [id]
    );
  }
}

class Gara {
  int id;
  String name;
  String category;
  String date;
  String orario;
  Gara({@required this.name, @required this.category, @required this.date, @required this.orario, this.id});
  Map<String, dynamic> toMap() {
    return {'name': name, 'category': category, 'date': date, 'orario': orario};
  }
}