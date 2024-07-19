class TarefaSQLiteModel {
  int _id = 0;
  String _descricao = '';
  bool _concluido = false;

  TarefaSQLiteModel(this._descricao, this._concluido);

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  // ignore: unnecessary_getters_setters
  String get descricao => _descricao;

  // ignore: avoid_return_types_on_setters
  void set descricao(String descricao) {
    _descricao = descricao;
  }

  // ignore: unnecessary_getters_setters
  bool get concluido => _concluido;

  // ignore: avoid_return_types_on_setters
  void set concluido(bool concluido) {
    _concluido = concluido;
  }
}
