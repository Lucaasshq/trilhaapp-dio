import 'package:flutter/material.dart';
import 'package:trilhaapp/model/tarefa.dart';
import 'package:trilhaapp/pages/service/repositories/tarefa_repository.dart';

class TarefaHivePage extends StatefulWidget {
  const TarefaHivePage({super.key});

  @override
  State<TarefaHivePage> createState() => _TarefaHivePageState();
}

class _TarefaHivePageState extends State<TarefaHivePage> {
  var tarefaRepository = TarefaRepository();
  var _tarefas = <Tarefa>[];
  TextEditingController descricaoController = TextEditingController();
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    if (apenasNaoConcluidos) {
      _tarefas = await tarefaRepository.listarNaoConcluidas();
    } else {
      _tarefas = await tarefaRepository.listaTarefas();
    }

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
                          await tarefaRepository.adicionar(Tarefa(descricaoController.text, false));
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
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
                      key: Key(tarefa.id),
                      onDismissed: (DismissDirection direction) async {
                        await tarefaRepository.remove(tarefa.id);
                        obterTarefas();
                      },
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                            value: tarefa.concluido,
                            onChanged: (bool value) async {
                              tarefaRepository.alterar(tarefa.id, value);
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
