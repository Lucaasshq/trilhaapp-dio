// ignore_for_file: unnecessary_getters_setters

class ConfiguracoesModel {
  String _nomeUsuario = '';
  double _altura = 0.0;
  bool _receberNotificacoes = false;
  bool _temaEscuro = false;

  ConfiguracoesModel.vazio() {
    _nomeUsuario = '';
    _altura = 0;
    _receberNotificacoes = false;
    _temaEscuro = false;
  }

  ConfiguracoesModel(
    this._nomeUsuario,
    this._altura,
    this._receberNotificacoes,
    this._temaEscuro,
  );

  String get nomeUsuario => _nomeUsuario;

  set nomeUsuario(String nome) {
    _nomeUsuario = nome;
  }

  double get altura => _altura;

  set altura(double altura) {
    _altura = altura;
  }

  bool get recebernotificacoes => _receberNotificacoes;

  set recebernotificacoes(bool notificacao) {
    _receberNotificacoes = notificacao;
  }

  bool get temaEscuro => _temaEscuro;

  set temaEscuro(bool temaEscuro) {
    _temaEscuro = temaEscuro;
  }
}
