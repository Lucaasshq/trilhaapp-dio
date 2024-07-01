// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao = '';
  bool _concluido = false;
  Tarefa(this._descricao, this._concluido);

  String get id => _id;

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
