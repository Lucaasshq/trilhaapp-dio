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
  String endereco = '';
  String cidade = '';
  String estado = '';
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
                maxLength: 8,
                keyboardType: TextInputType.number,
                
                onChanged: (value) {
                  var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                  print(cep);
                  if (value.trim().length == 8) {
                    cidade = 'cidade';
                    estado = 'estado';
                    endereco = 'endereço';
                  } else {
                    cidade = '';
                    estado = '';
                    endereco = '';
                  }
                  setState(() {});
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'CEP',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                endereco,
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                '$cidade  $estado',
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          var response = await http.get(Uri.parse('https://www.google.com'));
          print(response.body);
          print(response.statusCode);
        }),
      ),
    );
  }
}
