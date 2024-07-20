import 'package:trilhaapp/model/tarefa_sqlite_model.dart';
import 'package:trilhaapp/pages/service/repositories/sqlite/sqlite_database.dart';

class TarefaSQLiteRepository {
  Future<List<TarefaSQLiteModel>> obterDados() async {
    List<TarefaSQLiteModel> tarefas = [];
    var db = await SQLiteDataBase().obterDataBase();
    var result = await db.rawQuery('SELECT id, descricao, concluido FROM tarefas');
    for (var element in result) {
      tarefas.add(
        TarefaSQLiteModel(
          int.parse(element['id'].toString()),
          element['descricao'].toString(),
          element['concluido'] == '1',
        ),
      );
    }
    return tarefas;
  }

  Future<void> salvar(TarefaSQLiteModel tarefaSQLIteModel) async {
    var db = await SQLiteDataBase().obterDataBase();
    db.rawInsert(
      'INSERT INTO tarefas (descricao, concluido) values(?,?)',
      [tarefaSQLIteModel.descricao, tarefaSQLIteModel.concluido],
    );
  }
}
