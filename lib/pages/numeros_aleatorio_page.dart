import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NumeroAleatoriosPage extends StatefulWidget {
  const NumeroAleatoriosPage({super.key});

  @override
  State<NumeroAleatoriosPage> createState() => _NumeroAleatoriosPageState();
}

class _NumeroAleatoriosPageState extends State<NumeroAleatoriosPage> {
  int randomNumber = 0;
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
            children: [Text(randomNumber.toString())],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var random = Random();

            setState(() {
              randomNumber = random.nextInt(1000);
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
