// ignore_for_file: constant_identifier_names

import 'package:hive/hive.dart';
import 'package:trilhaapp/model/dados_cadastrais_model.dart';

class DadosCadastraisRepository {
  static late Box _box;
  static const _CHAVE_DADOS_CADASTRAIS_MODEL = 'CHAVE_DADOS_CADASTRAIS_MODEL';
  DadosCadastraisRepository._criar();
  static Future<DadosCadastraisRepository> carregar() async {
    if (Hive.isBoxOpen(_CHAVE_DADOS_CADASTRAIS_MODEL)) {
      _box = Hive.box(_CHAVE_DADOS_CADASTRAIS_MODEL);
    } else {
      _box = await Hive.openBox(_CHAVE_DADOS_CADASTRAIS_MODEL);
    }
    return DadosCadastraisRepository._criar();
  }

  void salvar(DadosCadastraisModel dadosCadastraisModel) {
    _box.put(_CHAVE_DADOS_CADASTRAIS_MODEL, dadosCadastraisModel);
  }

  DadosCadastraisModel obterDados() {
    var dadosCadastraisModel = _box.get(_CHAVE_DADOS_CADASTRAIS_MODEL);
    if (dadosCadastraisModel == null) {
      return DadosCadastraisModel.vazio();
    }
    return dadosCadastraisModel;
  }
}
