import 'package:flutter/material.dart';
import 'package:trilhaapp/model/tarefa_hive_model.dart';
import 'package:trilhaapp/Repositories/tarefa_hive_repository.dart';

class TarefaHivePage extends StatefulWidget {
  const TarefaHivePage({super.key});

  @override
  State<TarefaHivePage> createState() => _TarefaHivePageState();
}

class _TarefaHivePageState extends State<TarefaHivePage> {
  late TarefaHiveRepository tarefaRepository;
  var _tarefas = <TarefaHiveModel>[];
  TextEditingController descricaoController = TextEditingController();
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    tarefaRepository = await TarefaHiveRepository.carregar();

    _tarefas = tarefaRepository.obterDados(apenasNaoConcluidos);

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
                          await tarefaRepository.salvar(TarefaHiveModel.criar(descricaoController.text, false));
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
                      key: Key(tarefa.id),
                      onDismissed: (DismissDirection direction) async {
                        await tarefaRepository.excluir(tarefa);
                        obterTarefas();
                      },
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                            value: tarefa.concluido,
                            onChanged: (bool value) async {
                              tarefa.concluido = value;
                              tarefaRepository.alterar(tarefa);
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
