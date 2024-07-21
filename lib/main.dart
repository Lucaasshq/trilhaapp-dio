import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trilhaapp/model/dados_cadastrais_hive_model.dart';
import 'model/tarefa_hive_model.dart';
import 'pages/my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';





void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory documentsDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  Hive.registerAdapter(DadosCadastraisModelAdapter());
  Hive.registerAdapter(TarefaHiveModelAdapter());
  runApp(const MyApp());
}
