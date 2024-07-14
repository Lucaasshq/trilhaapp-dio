// ignore_for_file: constant_identifier_names, camel_case_types, unused_element

import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES {
  CHAVE_DADOS_CADASTRAIS_NOME,
  CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO,
  CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_LINGUAGEM,
  CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_SALARIO,
  CHAVE_NOME_USUARIO,
  CHAVE_ALTURA,
  CHAVE_RECEBER_NOTIFICACOES,
  CHAVE_TEMA_ESCURO
}

class AppStorageSevice {
  //? Metodos

   _setString(String chave, String value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? '';
  }

   _setStringList(String chave, List<String> values) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

   _setInt(String chave, int value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

   _setDouble(String chave, double value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }

  _setBool(String chave, bool value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }

  //? Gets and Settes
  ///////////////////////////////////////////////////////////////////////////

  Future<void> setDadosCadastraisNome(String nome) async {
   await _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString(), nome);
  }

  Future<String?> getDadosCadastraisNome() async {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString());
  }

  ////////////////////////////////////////////////////////////////////////////////

  Future<void> setDadosCadastraisDataNascimento(DateTime date) async {
   await _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString(),
        date.toString());
  }

  Future<String?> getDadosCadastraisDataNascimento() async {
    return _getString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString());
  }

  ////////////////////////////////////////////////////////////////////////////////

  Future<void> setDadosCadastraisNivelExperiencia(String nivel) async {
   await _setString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString(),
        nivel);
  }

  Future<String?> getDadosCadastraisNivelExperiencia() async {
    return _getString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString());
  }

  ////////////////////////////////////////////////////////////////////////////////

  Future<void> setDadosCadastraisLinguagem(List<String> linguagem) async {
   await _setStringList(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGEM.toString(), linguagem);
  }

  Future<List<String>> getDadosCadastraisLinguagem() {
    return _getStringList(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGEM.toString());
  }

  ////////////////////////////////////////////////////////////////////////////////

  Future<void> setDadosCadastraisTempoExperiencia(int tempo) async {
   await _setInt(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString(),
        tempo);
  }

  Future<int> getDadosCadastraisTempoExperiencia() async {
    return _getInt(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString());
  }

  ////////////////////////////////////////////////////////////////////////////////

  Future<void> setDadosCadastraisSalario(double salario) async {
   await _setDouble(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString(), salario);
  }

  Future<double> getDadosCadastraisSalario() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString());
  }
}
