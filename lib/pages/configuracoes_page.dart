import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String? nomeUsuario;
  double? altura;
  bool receberNotificacoes = false;
  bool temaEscuro = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        body: Container(
          child: ListView(
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
              TextButton(onPressed: () {}, child: const Text('Salvar'))
            ],
          ),
        ),
      ),
    );
  }
}
