// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:trilhaapp/model/viacep_model.dart';
import 'package:trilhaapp/pages/repositories/via_cep_repository.dart';

class ConsultaCEP extends StatefulWidget {
  const ConsultaCEP({super.key});

  @override
  State<ConsultaCEP> createState() => _ConsultaCEPState();
}

class _ConsultaCEPState extends State<ConsultaCEP> {
  TextEditingController cepController = TextEditingController(text: '');
  var viaCepModel = ViaCepModel();
  var viaCepRepository = ViaCepRepository();
  bool loading = false;
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
                onChanged: (value) async {
                  setState(() {
                    loading = true;
                  });
                  var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                  if (value.trim().length == 8) {
                    viaCepModel = await viaCepRepository.getCep(cep);
                  }

                  setState(() {
                    loading = false;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'CEP',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 45,
                child: Text(
                  "Cidade: ${viaCepModel.localidade ?? ''} ${viaCepModel.uf ?? ''}",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 45,
                child: Text(
                  'Logradouro: ${viaCepModel.logradouro ?? ''}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Visibility(visible: loading, child: const CircularProgressIndicator())
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {

        }),
      ),
    );
  }
}
