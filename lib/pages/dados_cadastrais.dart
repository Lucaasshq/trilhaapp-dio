import 'package:flutter/material.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nomeController = TextEditingController(text: '');
    TextEditingController dataNascimentoController =
        TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Dados'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nome',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextField(
              controller: nomeController,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Data de nascimento'),
            TextField(
              controller: dataNascimentoController,
              readOnly: true,
              onTap: () async {
                var data = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900, 5, 20),
                  lastDate: DateTime(2025, 10, 23),
                );
                print(data);
              },
            ),
            TextButton(
              onPressed: () {
                debugPrint(nomeController.text);
              },
              child: const Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }
}
