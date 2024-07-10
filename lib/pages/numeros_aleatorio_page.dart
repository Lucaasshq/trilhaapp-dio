import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumeroAleatoriosPage extends StatefulWidget {
  const NumeroAleatoriosPage({super.key});

  @override
  State<NumeroAleatoriosPage> createState() => _NumeroAleatoriosPageState();
}

class _NumeroAleatoriosPageState extends State<NumeroAleatoriosPage> {
  int? randomNumber = 0;
  // ignore: non_constant_identifier_names
  final CHAVE_NUMERO_ALEATORIO = 'numero_aleatorio';

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    final storage = await SharedPreferences.getInstance();
    setState(() {
      randomNumber = storage.getInt(CHAVE_NUMERO_ALEATORIO);
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
                randomNumber.toString(),
                style: const TextStyle(
                  fontSize: 22,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final storage = await SharedPreferences.getInstance();
            var random = Random();

            setState(() {
              randomNumber = random.nextInt(1000);
            });
            storage.setInt(CHAVE_NUMERO_ALEATORIO, randomNumber!);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
