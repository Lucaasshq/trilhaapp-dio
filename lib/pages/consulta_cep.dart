// ignore_for_file: avoid_unnecessary_containers
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  TextEditingController cepController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const Text(
                'Consulta de CEP',
                style: TextStyle(fontSize: 22),
              ),
              TextField(
                controller: cepController,
                onChanged: (cep) {
                  if (cep != null && cep.trim().length == 8) {}
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'CEP',
                ),
              ),
              TextField(
                controller: cepController,
                onChanged: (cep) {
                  if (cep != null && cep.trim().length == 8) {}
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'CEP',
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          var response = await http.get(Uri.parse('https://www.google.com/lucas'));
          print(response.body);
          print(response.statusCode);
        }),
      ),
    );
  }
}
