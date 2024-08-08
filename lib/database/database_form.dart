import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseForm {
  static final DataBaseForm _instance = DataBaseForm._internal();
  factory DataBaseForm() => _instance;
  DataBaseForm._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_form.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE clientes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cedula TEXT,
        apellido TEXT,
        nombre TEXT,
        correo TEXT, 
        telefono TEXT,
        sexo TEXT,
        estadoCivil TEXT,
        direccion TEXT
      )
    ''');
  }

  Future<int> insertClient(Map<String, dynamic> client) async {
    try {
      Database db = await database;
      return await db.insert('clientes', client);
    } catch (e) {
      print('Error al ingresar cliente: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getClients() async {
    try {
      Database db = await database;
      return await db.query('clientes');
    } catch (e) {
      print('Error al obtener clientes: $e');
      rethrow;
    }
  }

  
}
