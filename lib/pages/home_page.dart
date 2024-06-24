import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/service/gerador_numero_aleatorio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int numeroGerado = 0;
  int quantidade = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu App',
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Text(
                " Foi clicado $quantidade",
                style: const TextStyle(fontSize: 28),
              ),
            ),
            SizedBox(
              width: 200,
              height: 200, 
              
              child: Text(
                "O Número gerado $numeroGerado",
                style: const TextStyle(fontSize: 28),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    child: const Text(
                      "10",
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                    child: const Text(
                      "10",
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: const Text(
                    "10",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_box),
          onPressed: () {
            setState(() {
              quantidade = quantidade + 1;
              numeroGerado =
                  GeradorNumeroAleatorioService.gerarNumeroAleatorio();
            });
          }),
    );
  }
}
