// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NumeroAleatoriosHivePage extends StatefulWidget {
  const NumeroAleatoriosHivePage({super.key});

  @override
  State<NumeroAleatoriosHivePage> createState() => _NumeroAleatoriosHivePageState();
}

class _NumeroAleatoriosHivePageState extends State<NumeroAleatoriosHivePage> {
  int? numeroGerado;
  int? quantidadeCliques = 0;
  late Box BoxNumerosAleatorios;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    if (Hive.isBoxOpen('box_numeros_aleatorios')) {
      BoxNumerosAleatorios = Hive.box('box_numeros_aleatorios');
    } else {
      BoxNumerosAleatorios = await Hive.openBox('box_numeros_aleatorios');
    }
    numeroGerado = BoxNumerosAleatorios.get('numeroGerado');
    quantidadeCliques = BoxNumerosAleatorios.get('quantidadeCliques');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hive'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado == null ? 'Nenhum número gerado' : numeroGerado.toString(),
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              Text(
                quantidadeCliques == null ? 'Nenhum Clique' : quantidadeCliques.toString(),
                style: const TextStyle(
                  fontSize: 22,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeCliques = (quantidadeCliques ?? 0) + 1;
            });
            BoxNumerosAleatorios.put('numeroGerado', numeroGerado);
            BoxNumerosAleatorios.put('quantidadeCliques', quantidadeCliques);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
