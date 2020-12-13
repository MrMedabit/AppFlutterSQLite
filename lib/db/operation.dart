import 'package:app_libreria/models/libro.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Operation {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'libros.db'),
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE libros(id INTEGER PRIMARY KEY, isbn TEXT, titulo TEXT, autor TEXT, editorial TEXT)',
      );
    }, version: 1);
  }

  static Future<void> crear(Libro libro) async {
    Database database = await _openDB();

    return database.insert("libros", libro.toMap());
  }

  static Future<void> update(Libro libro) async {
    Database database = await _openDB();

    return database.update("libros", libro.toMap(),
        where: 'id = ?', whereArgs: [libro.id]);
  }

  static Future<void> delete(Libro libro) async {
    Database database = await _openDB();
    return database.delete("libros", where: "id = ?", whereArgs: [libro.id]);
  }

  static Future<List<Libro>> libros() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> librosMap = await database.query("libros");

    for (var i in librosMap) {
      print("____" + i['titulo']);
    }

    return List.generate(
        librosMap.length,
        (index) => Libro(
            id: librosMap[index]['id'],
            isbn: librosMap[index]['isbn'],
            titulo: librosMap[index]['titulo'],
            autor: librosMap[index]['autor'],
            editorial: librosMap[index]['editorial']));
  }
}
