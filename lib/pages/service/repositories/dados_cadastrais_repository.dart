
// ignore_for_file: constant_identifier_names

import 'package:hive/hive.dart';
import 'package:trilhaapp/model/dados_cadastrais_model.dart';

class DadosCadastraisRepository {
  static late Box _box;
  static const CHAVE_DADOS_CADASTRAIS_MODEL = 'CHAVE_DADOS_CADASTRAIS_MODEL';
  DadosCadastraisRepository._criar();
  static Future<DadosCadastraisRepository> carregar() async {
    if (Hive.isBoxOpen(CHAVE_DADOS_CADASTRAIS_MODEL)) {
      _box = Hive.box(CHAVE_DADOS_CADASTRAIS_MODEL);
    } else {
      _box = await Hive.openBox(CHAVE_DADOS_CADASTRAIS_MODEL);
    }
    return DadosCadastraisRepository._criar();
  }

  void salvar(DadosCadastraisModel dadosCadastraisModel) {
    _box.put(CHAVE_DADOS_CADASTRAIS_MODEL, {
      'nome': dadosCadastraisModel.nome,
      'dataNascimento': dadosCadastraisModel.dataNascimento,
      'nivelExperiencia': dadosCadastraisModel.nivelExperiencia,
      'linguagens': dadosCadastraisModel.linguagens,
      'tempoExperiencia': dadosCadastraisModel.tempoExperiencia,
      'salario': dadosCadastraisModel.salario,
    });

    DadosCadastraisModel obterDados() {
      var dadosCadastrais = _box.get(CHAVE_DADOS_CADASTRAIS_MODEL);
      if (dadosCadastrais == null) {
        return DadosCadastraisModel.vazio();
      }
      return DadosCadastraisModel(
        dadosCadastrais['nome'],
        dadosCadastrais['dataNascimento'],
        dadosCadastrais['nivelExperiencia'],
        dadosCadastrais['linguagens'],
        dadosCadastrais['tempoExperiencia'],
        dadosCadastrais['salario'],
      );
    }
  }
}
