import 'package:flutter/material.dart';
import 'package:trilhaapp/Repositories/database/sqlite/tarefa_sqlite_repository.dart';

import 'package:trilhaapp/model/tarefa_sqlite_model.dart';


class TarefaSQLitePage extends StatefulWidget {
  const TarefaSQLitePage({super.key});

  @override
  State<TarefaSQLitePage> createState() => _TarefaSQLitePageState();
}

class _TarefaSQLitePageState extends State<TarefaSQLitePage> {
  TarefaSQLiteRepository tarefaRepository = TarefaSQLiteRepository();
  var _tarefas = <TarefaSQLiteModel>[];
  TextEditingController descricaoController = TextEditingController();
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    _tarefas = await tarefaRepository.obterDados(apenasNaoConcluidos);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            descricaoController.text = '';
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text('Adicionar Tarefa'),
                    content: TextField(
                      controller: descricaoController,
                      decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await tarefaRepository.salvar(TarefaSQLiteModel(
                            0,
                            descricaoController.text,
                            false,
                          ));
                          Navigator.pop(context);
                          obterTarefas();
                          setState(() {});
                        },
                        child: const Text('Salvar'),
                      )
                    ],
                  );
                });
          },
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Filtrar não concludias'),
                  Switch(
                      value: apenasNaoConcluidos,
                      onChanged: (bool value) {
                        apenasNaoConcluidos = value;
                        obterTarefas();
                        setState(() {});
                      })
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (context, index) {
                    var tarefa = _tarefas[index];
                    return Dismissible(
                      key: Key(tarefa.id.toString()),
                      onDismissed: (DismissDirection direction) async {
                        await tarefaRepository.remover(tarefa.id);
                        obterTarefas();
                      },
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                            value: tarefa.concluido,
                            onChanged: (bool value) async {
                              tarefa.concluido = value;
                              tarefaRepository.atualizar(tarefa);
                              obterTarefas();
                            }),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
