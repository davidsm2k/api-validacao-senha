import 'package:desafioItau/database/dao/usuario_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDataBase() async {
  final String path = join(await getDatabasesPath(), 'desafioItau.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(UsuarioDAO.tableUsuario);
  }, version: 1);
}


