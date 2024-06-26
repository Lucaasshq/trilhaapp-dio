import 'package:flutter/material.dart';

class DadosCadastrais extends StatelessWidget {
  const DadosCadastrais({super.key, required this.dados});
  final List<String> dados;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Dados'),
      ),
      body: Center(
        child: Text(dados.length.toString()),
      ),
    );
  }
}
