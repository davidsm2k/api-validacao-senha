import 'package:desafioItau/database/app_database.dart';
import 'package:desafioItau/models/usuario.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioDAO {
  static const String _tableName = 'logins';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _email = 'email';
  static const String _password = 'password';
  static const String tableUsuario = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_email TEXT, '
      '$_password TEXT)';

  Future<int> save(Usuario usuario) async {
    final Database db = await createDataBase();
    Map<String, dynamic> usuarioMap = _toMap(usuario);
    return db.insert(_tableName, usuarioMap);
  }
  Map<String, dynamic> _toMap(Usuario usuario) {
    final Map<String, dynamic> usuarioMap = Map();
    usuarioMap[_name] = usuario.name;
    usuarioMap[_email] = usuario.email;
    usuarioMap[_password] = usuario.password;
    return usuarioMap;
  }

  Future<List<Usuario>> findAll() async {
    final Database db = await createDataBase();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    List<Usuario> usuarios = _toList(maps);
    return usuarios;
  }

  List<Usuario> _toList(List<Map<String, dynamic>> maps) {
    final List<Usuario> usuarios = List();
    for (Map<String, dynamic> map in maps) {
      final Usuario usuario = Usuario(
        map[_id],
        map[_name],
        map[_email],
        map[_password],
      );
      usuarios.add(usuario);
    }
    return usuarios;
  }
}
