import 'package:hive/hive.dart';
import 'package:trilhaapp/model/tarefa_hive_model.dart';

class TarefaHiveRepository {
  static late Box _box;
  static const _CHAVE_TAREFA_REPOSITORY = 'CHAVE_TAREFA_REPOSITORY';
  TarefaHiveRepository._criar();
  static Future<TarefaHiveRepository> carregar() async {
    if (Hive.isBoxOpen(_CHAVE_TAREFA_REPOSITORY)) {
      _box = Hive.box(_CHAVE_TAREFA_REPOSITORY);
    } else {
      _box = await Hive.openBox(_CHAVE_TAREFA_REPOSITORY);
    }
    return TarefaHiveRepository._criar();
  }

  salvar(TarefaHiveModel tarefaHiveModel) {
    _box.add(tarefaHiveModel);
  }

 List<TarefaHiveModel> obterDados() {
    return _box.values.cast<TarefaHiveModel>().toList();
  }
}
