// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trilhaapp/services/app_storage.dart';

class ConfiguracoesSharedPreferecesPage extends StatefulWidget {
  const ConfiguracoesSharedPreferecesPage({super.key});

  @override
  State<ConfiguracoesSharedPreferecesPage> createState() => _ConfiguracoesSharedPreferecesPageState();
}

class _ConfiguracoesSharedPreferecesPageState extends State<ConfiguracoesSharedPreferecesPage> {
  AppStorageSevice storage = AppStorageSevice();
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = 'CHAVE_NOME_USUARIO';
  final CHAVE_ALTURA = 'CHAVE_ALTURA';
  final CHAVE_RECEBER_NOTIFICACOES = 'CHAVE_RECEBER_NOTIFICACOES';
  final CHAVE_TEMA_ESCURO = 'CHAVE_TEMA_ESCURO';

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    alturaController.text = (await storage.getConfiguracoesAltura()).toString();
    receberNotificacoes = await storage.getConfiguracoesReceberNotificacoes();
    temaEscuro = await storage.getConfiguracoesTemaEscuro();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
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
                value: receberNotificacoes,
                onChanged: (bool value) {
                  setState(() {
                    receberNotificacoes = value;
                  });
                }),
            SwitchListTile(
                title: const Text('Tema escuro'),
                value: temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    temaEscuro = value;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  //! comando para fechar o teclado
                  try {
                    await storage.setConfiguracoesAltura(double.parse(alturaController.text));
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
                  await storage.setConfiguracoesNomeUsuario(nomeUsuarioController.text);
                  await storage.setConfiguracoesReceberNotificacoes(receberNotificacoes);
                  await storage.setConfiguracoesTemaEscuro(temaEscuro);
                  Navigator.pop(context);
                },
                child: const Text('Salvar'))
          ],
        ),
      ),
    );
  }
}
