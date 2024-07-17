// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trilhaapp/model/configuracoes_model.dart';
import 'package:trilhaapp/pages/service/repositories/configuracoes_repository.dart';

class ConfiguracoesHivePage extends StatefulWidget {
  const ConfiguracoesHivePage({super.key});

  @override
  State<ConfiguracoesHivePage> createState() => _ConfiguracoesHivePageState();
}

class _ConfiguracoesHivePageState extends State<ConfiguracoesHivePage> {
  late ConfiguracoesRepository configuracoesRepository;
  var configuracoesModel = ConfiguracoesModel.vazio();
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    configuracoesRepository = await ConfiguracoesRepository.carregar();
    configuracoesModel = configuracoesRepository.obterDados();
    nomeUsuarioController.text = configuracoesModel.nomeUsuario;
    alturaController.text = configuracoesModel.altura.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configurações Hive'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Nome Usuário'),
                controller: nomeUsuarioController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(hintText: 'Altura'),
                controller: alturaController,
                keyboardType: TextInputType.number,
              ),
            ),
            SwitchListTile(
                title: const Text('Receber Notifições'),
                value: configuracoesModel.recebernotificacoes,
                onChanged: (bool value) {
                  setState(() {
                    configuracoesModel.recebernotificacoes = value;
                  });
                }),
            SwitchListTile(
                title: const Text('Tema escuro'),
                value: configuracoesModel.temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    configuracoesModel.temaEscuro = value;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  //! comando para fechar o teclado
                  try {
                    configuracoesModel.altura = double.parse(alturaController.text);
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text('erro'),
                          content: const Text('Altura Invalida'),
                          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
                        );
                      },
                    );
                    return;
                  }
                  configuracoesModel.nomeUsuario = nomeUsuarioController.text;
                  configuracoesRepository.salvar(configuracoesModel);
                  Navigator.pop(context);
                },
                child: const Text('Salvar'))
          ],
        ),
      ),
    );
  }
}
