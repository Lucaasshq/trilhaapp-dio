// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/service/repositories/linguagens_repository.dart';
import 'package:trilhaapp/pages/service/repositories/nivel_repository.dart';
import 'package:trilhaapp/services/app_storage.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({super.key});

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {
  var sdfsdlfmsdlkfmssgjkfnkgsjdfdfdfdfdfddfdfdfdfdfdfdfdfdfdfdfffffdffdfdf = false;
  TextEditingController nomeController = TextEditingController(text: '');
  TextEditingController dataNascimentoController = TextEditingController(text: '');
  DateTime? dataNascimento;

  NivelRepository niveisRepository = NivelRepository();
  LinguagensRepository linguagensRepository = LinguagensRepository();
  List<String> niveis = [];
  List<String> linguagens = [];
  var nivelSelecionado = "";
  List<String> linguagensSelecionadas = [];
  double salarioEscolhido = 0.0;
  int tempoExperiencia = 0;
  AppStorageSevice storage = AppStorageSevice();
  final String CHAVE_DADOS_CADASTRAIS_NOME = 'CHAVE_DADOS_CADASTRAIS_NOME';
  final String CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO = 'CHAVE_DADOS_CADASTRAIS_DATA_NASCIMENTO';
  final String CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA = 'CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA';
  final String CHAVE_DADOS_CADASTRAIS_LINGUAGEM = 'CHAVE_DADOS_CADASTRAIS_LINGUAGEM';
  final String CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA = 'CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA';
  final String CHAVE_DADOS_CADASTRAIS_SALARIO = 'CHAVE_DADOS_CADASTRAIS_SALARIO';
  bool salvando = false;

  @override
  void initState() {
    niveis = niveisRepository.retornarNiveis();
    linguagens = linguagensRepository.retornarLinguagens();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeController.text = await storage.getDadosCadastraisNome() ?? '';

    dataNascimentoController.text = await storage.getDadosCadastraisDataNascimento() ?? '';

    if (dataNascimentoController.text.isNotEmpty) {
      dataNascimento = DateTime.parse(dataNascimentoController.text);
    }

    nivelSelecionado = await storage.getDadosCadastraisNivelExperiencia() ?? '';

    linguagensSelecionadas = await storage.getDadosCadastraisLinguagem();

    tempoExperiencia = await storage.getDadosCadastraisTempoExperiencia();

    salarioEscolhido = await storage.getDadosCadastraisSalario();
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
                              } else {
                                linguagensSelecionadas.remove(linguagem);
                              }
                              setState(() {});
                            }))
                        .toList(),
                  ),
                  const TextLabel(texto: 'Tempo de experiência'),
                  DropdownButton(
                    value: tempoExperiencia,
                    isExpanded: true,
                    items: returnItens(50),
                    onChanged: (value) {
                      setState(() {
                        tempoExperiencia = int.parse(value.toString());
                      });
                    },
                  ),
                  TextLabel(texto: 'Pretenção Salarial. R\$ ${salarioEscolhido.round()}'),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: salarioEscolhido,
                      onChanged: (value) {
                        setState(() {
                          salarioEscolhido = value;
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
                      if (dataNascimento == null) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Data de nascimento inválida!'),
                        ));
                        return;
                      }
                      if (nivelSelecionado.trim() == '') {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Selecione um Nivel de experiência!'),
                        ));
                        return;
                      }
                      if (linguagensSelecionadas.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Deve ser selecionado ao menos uma linguagem!'),
                        ));
                        return;
                      }
                      if (tempoExperiencia == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Deve ter ao menos um ano de experiência em uma das linguagens'),
                        ));
                        return;
                      }
                      if (salarioEscolhido == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('A pretenção salároa deve ser maior que R\$0'),
                        ));
                        return;
                      }

                      await storage.setDadosCadastraisNome(nomeController.text);
                      await storage.setDadosCadastraisDataNascimento(dataNascimento!);
                      await storage.setDadosCadastraisNivelExperiencia(nivelSelecionado);
                      await storage.setDadosCadastraisLinguagem(linguagensSelecionadas);
                      await storage.setDadosCadastraisTempoExperiencia(tempoExperiencia);
                      await storage.setDadosCadastraisSalario(salarioEscolhido);

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
