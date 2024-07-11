// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumeroAleatoriosPage extends StatefulWidget {
  const NumeroAleatoriosPage({super.key});

  @override
  State<NumeroAleatoriosPage> createState() => _NumeroAleatoriosPageState();
}

class _NumeroAleatoriosPageState extends State<NumeroAleatoriosPage> {
  int? randomNumber;
  int? quantidadeCliques = 0;
  final CHAVE_QUANTIDADE_CLIQUES = 'quantidade_cliques';
  final CHAVE_NUMERO_ALEATORIO = 'numero_aleatorio';
  late SharedPreferences storage;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      randomNumber = storage.getInt(CHAVE_NUMERO_ALEATORIO);
      quantidadeCliques = storage.getInt(CHAVE_QUANTIDADE_CLIQUES);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gerador de números'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                randomNumber == null
                    ? 'Nenhum número gerado'
                    : randomNumber.toString(),
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              Text(
                quantidadeCliques == null
                    ? 'Nenhum Clique'
                    : quantidadeCliques.toString(),
                style: const TextStyle(
                  fontSize: 22,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var random = Random();
            setState(() {
              randomNumber = random.nextInt(1000);
              quantidadeCliques = (quantidadeCliques ?? 0) + 1;
            });
            storage.setInt(CHAVE_NUMERO_ALEATORIO, randomNumber!);
            storage.setInt(CHAVE_QUANTIDADE_CLIQUES, quantidadeCliques!);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
