

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/service/repositories/dados_cadastrais_repository.dart';
import 'package:trilhaapp/pages/service/repositories/linguagens_repository.dart';
import 'package:trilhaapp/pages/service/repositories/nivel_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

import '../../model/dados_cadastrais_model.dart';

class DadosCadastraisHivePage extends StatefulWidget {
  const DadosCadastraisHivePage({super.key});

  @override
  State<DadosCadastraisHivePage> createState() => _DadosCadastraisHivePageState();
}

class _DadosCadastraisHivePageState extends State<DadosCadastraisHivePage> {
  late DadosCadastraisRepository dadosCadastraisRepository;
  DadosCadastraisModel dadosCadastraisModel = DadosCadastraisModel.vazio();
  TextEditingController nomeController = TextEditingController(text: '');
  TextEditingController dataNascimentoController = TextEditingController(text: '');
  List<String> niveis = [];
  List<String> linguagens = [];
  NivelRepository niveisRepository = NivelRepository();
  LinguagensRepository linguagensRepository = LinguagensRepository();

  bool salvando = false;

  @override
  void initState() {
    niveis = niveisRepository.retornarNiveis();
    linguagens = linguagensRepository.retornarLinguagens();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastraisModel.nome ?? '';
    dataNascimentoController.text = dadosCadastraisModel.dataNascimento.toString();
    setState(() {});
  }

  List<DropdownMenuItem> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Dados'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
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
                        dadosCadastraisModel.dataNascimento = data;
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
                              selected: dadosCadastraisModel.nivelExperiencia == nivel,
                              value: nivel.toString(),
                              groupValue: dadosCadastraisModel.nivelExperiencia,
                              onChanged: (value) {
                                setState(() {
                                  dadosCadastraisModel.nivelExperiencia = value.toString();
                                });
                              },
                            ),
                          )
                          .toList()),
                  const TextLabel(texto: 'Linguagem preferidas'),
                  Column(
                    children: linguagens
                        .map((linguagem) => CheckboxListTile(
                            title: Text(linguagem),
                            value: dadosCadastraisModel.linguagens.contains(linguagem),
                            onChanged: (bool? value) {
                              if (value!) {
                                dadosCadastraisModel.linguagens.add(linguagem);
                              } else {
                                dadosCadastraisModel.linguagens.remove(linguagem);
                              }
                              setState(() {});
                            }))
                        .toList(),
                  ),
                  const TextLabel(texto: 'Tempo de experiência'),
                  DropdownButton(
                    value: dadosCadastraisModel.tempoExperiencia,
                    isExpanded: true,
                    items: returnItens(50),
                    onChanged: (value) {
                      setState(() {
                        dadosCadastraisModel.tempoExperiencia = int.parse(value.toString());
                      });
                    },
                  ),
                  TextLabel(texto: 'Pretenção Salarial. R\$ ${dadosCadastraisModel.salario?.round()}'),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: dadosCadastraisModel.salario ?? 0,
                      onChanged: (value) {
                        setState(() {
                          dadosCadastraisModel.salario = value;
                        });
                      }),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        salvando = false;
                      });
                      if (nomeController.text.trim().length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('O Nome deve ser preenchido!'),
                        ));
                        return;
                      }
                      if (dadosCadastraisModel.dataNascimento == null) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Data de nascimento inválida!'),
                        ));
                        return;
                      }
                      if (dadosCadastraisModel.nivelExperiencia == null || dadosCadastraisModel.nivelExperiencia!.trim() == '') {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Selecione um Nivel de experiência!'),
                        ));
                        return;
                      }
                      if (dadosCadastraisModel.linguagens.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Deve ser selecionado ao menos uma linguagem!'),
                        ));
                        return;
                      }
                      if (dadosCadastraisModel.tempoExperiencia == 0 || dadosCadastraisModel.tempoExperiencia == null) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Deve ter ao menos um ano de experiência em uma das linguagens'),
                        ));
                        return;
                      }
                      if (dadosCadastraisModel.salario == 0 || dadosCadastraisModel.salario == null) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('A pretenção salároa deve ser maior que R\$0'),
                        ));
                        return;
                      }
                      dadosCadastraisModel.nome = nomeController.text;
                      dadosCadastraisRepository.salvar(dadosCadastraisModel);

                      setState(() {
                        salvando = true;
                      });
                      Future.delayed(const Duration(seconds: 3), () {
                        setState(() {
                          salvando = false;
                        });
                        Navigator.pop(context);
                      });
                    },
                    child: const Text('Salvar'),
                  )
                ],
              ),
      ),
    );
  }
}
