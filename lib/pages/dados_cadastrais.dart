import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/service/repositories/linguagens_repository.dart';
import 'package:trilhaapp/pages/service/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  TextEditingController nomeController = TextEditingController(text: '');
  TextEditingController dataNascimentoController =
      TextEditingController(text: '');
  DateTime? dataNascimento;

  NivelRepository niveisRepository = NivelRepository();
  LinguagensRepository linguagensRepository = LinguagensRepository();
  List<String> niveis = [];
  List<String> linguagens = [];
  var nivelSelecionado = "";
  var linguagensSelecionadas = [];

  void initState() {
    niveis = niveisRepository.retornarNiveis();
    linguagens = linguagensRepository.retornarLinguagens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Dados'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ListView(
          children: [
            const TextLabel(texto: 'Nome'),
            TextField(
              controller: nomeController,
            ),
            const TextLabel(texto: 'Data de nascimento'),
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
                if (data != null) {
                  dataNascimentoController.text = data.toString();
                  dataNascimento = data;
                }
              },
            ),
            const TextLabel(texto: 'Nivel de experiência'),
            Column(
                children: niveis
                    .map(
                      (nivel) => RadioListTile(
                        dense: true,
                        title: Text(nivel.toString()),
                        selected: nivelSelecionado == nivel,
                        value: nivel.toString(),
                        groupValue: nivelSelecionado,
                        onChanged: (value) {
                          setState(() {
                            nivelSelecionado = value.toString();
                          });
                          print(nivelSelecionado);
                        },
                      ),
                    )
                    .toList()),
            const TextLabel(texto: 'Linguagem preferidas'),
            Column(
              children: linguagens
                  .map((linguagem) => CheckboxListTile(
                      title: Text(linguagem),
                      value: linguagensSelecionadas.contains(linguagem),
                      onChanged: (bool? value) {
                        if (value!) {
                          linguagensSelecionadas.add(linguagem);
                        } else
                          linguagensSelecionadas.remove(linguagem);
                        setState(() {});
                      }))
                  .toList(),
            ),
            TextButton(
              onPressed: () {
                print(nomeController.text);
                print(dataNascimento);
              },
              child: const Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }
}
