import 'package:motovibe/bancodedados/database.dart';
import 'package:motovibe/model/DadosSalvos.dart';
import 'package:sqflite/sqlite_api.dart';

class MotoDao {
  static const String tablesql = "CREATE TABLE $tablename("
      "${_id} INTEGER PRIMARY KEY, "
      "${_modelo} TEXT, "
      "${_preco} DECIMAL,"
      "${_data} TEXT,"
      "${_hora} TEXT"
      ") ";
  static const String tablename = "historicoMotos";
  static const String _id = "id";
  static const String _modelo = "modelo";
  static const String _data = "data";
  static const String _hora = "hora";
  static const String _preco = "preco";

  Future<int> Salva(DadosSalvos item) async {
    final Database db = await CreateDabase();
    Map<String, dynamic> Mapitem = ToMap(item);
    return db.insert(tablename, Mapitem);
  }

  Map<String, dynamic> ToMap(DadosSalvos item) {
    final Map<String, dynamic> Mapitem = Map();
    Mapitem[_modelo] = item.modelo;
    Mapitem[_preco] = item.valor;
    Mapitem[_data] = item.data;
    Mapitem[_hora] = item.hora;
    return Mapitem;
  }

  Future<List<DadosSalvos>> Buscatudo() async {
    final Database db = await CreateDabase();
    final List<Map<String, dynamic>> result = await db.query(tablename);
    List<DadosSalvos> itemlistado = ToList(result);
    return itemlistado;
  }

  List<DadosSalvos> ToList(List<Map<String, dynamic>> result) {
    final List<DadosSalvos> itemlistado = List();
    for (Map<String, dynamic> row in result) {
      final DadosSalvos item =
          DadosSalvos(row[_modelo], row[_preco], row[_data], row[_hora]);
      itemlistado.add(item);
    }
    return itemlistado;
  }
}
