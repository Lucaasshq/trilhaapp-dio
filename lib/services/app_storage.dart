// ignore_for_file: constant_identifier_names, camel_case_types, unused_element

import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES {
  CHAVE_DADOS_CADASTRAIS_NOME,
  CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO,
  CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_LINGUAGEM,
  CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_SALARIO
}

class AppStorageSevice {
  //? Metodos

  void _setString(String chave, String value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? '';
  }

  void _setStringList(String chave, List<String> values) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  void _setInt(String chave, int value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  void _setDouble(String chave, double value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }

  void _setBool(String chave, bool value) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }

  //? Gets and Settes
  ///////////////////////////////////////////////////////////////////////////

  void setDadosCadastraisNome(String nome) {
    _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString(), nome);
  }

  Future<String?> getDadosCadastraisNome() async {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString());
  }

  ////////////////////////////////////////////////////////////////////////////////

  void setDadosCadastraisDataNascimento(DateTime date) async {
    _setString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString(),
        date.toString());
  }

  Future<String?> getDadosCadastraisDataNascimento() async {
    return _getString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO.toString());
  }

  ////////////////////////////////////////////////////////////////////////////////

  void setDadosCadastraisNivelExperiencia(String nivel) {
    _setString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString(),
        nivel);
  }

  Future<String?> getDadosCadastraisNivelExperiencia() async {
    return _getString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA.toString());
  }

  ////////////////////////////////////////////////////////////////////////////////

  void setDadosCadastraisLinguagem(List<String> linguagem) {
    _setStringList(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGEM.toString(), linguagem);
  }

  Future<List<String>> getDadosCadastraisLinguagem() {
    return _getStringList(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGEM.toString());
  }

  ////////////////////////////////////////////////////////////////////////////////

  void setDadosCadastraisTempoExperiencia(int tempo) {
    _setInt(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString(),
        tempo);
  }

  Future<int> getDadosCadastraisTempoExperiencia() async {
    return _getInt(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString());
  }

  ////////////////////////////////////////////////////////////////////////////////

  void setDadosCadastraisSalario(double salario) {
    _setDouble(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString(), salario);
  }

  Future<double> getDadosCadastraisSalario() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString());
  }
}
