import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/configura%C3%A7%C3%B5es/configuracoes_hive_page.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/logins_page.dart';
import 'package:trilhaapp/pages/numeros_aleatorio_page_hive.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                context: context,
                builder: (context) {
                  return Wrap(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        leading: const Icon(Icons.camera_alt),
                        title: const Text('Camera'),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        leading: const Icon(Icons.image),
                        title: const Text(
                          'Galeria',
                        ),
                      )
                    ],
                  );
                },
              );
            },
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/1373/1373255.png',
                ),
              ),
              accountName: const Text(
                'Lucas Henrique',
              ),
              accountEmail: const Text('email@gmail.com'),
            ),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 5),
                  Text('Dados cadastráis'),
                ],
              ),
            ),
            onTap: () => {
              //? Fechar tela anterior
              Navigator.pop(context),
              //? Abri nova tela de Dados cadastrais
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DadosCadastrais(),
                ),
              )
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.insert_drive_file_outlined),
                  SizedBox(width: 5),
                  Text('Termos de uso e privacidade'),
                ],
              ),
            ),
            onTap: () => {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: const Column(
                        children: [
                          Text(
                            'Termos de privacidade',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '     Caros amigos, a expansão dos mercados mundiais assume importantes posições no estabelecimento do fluxo de informações. O que temos que ter sempre em mente é que o entendimento das metas propostas garante a contribuição de um grupo importante na determinação das diretrizes de desenvolvimento para o futuro. Todavia, a contínua expansão de nossa atividade estimula a padronização do impacto na agilidade decisória. Evidentemente, a estrutura atual da organização desafia a capacidade de equalização das condições inegavelmente apropriadas. ',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  })
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 5),
                  Text('Configurações'),
                ],
              ),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConfiguracoesHivePage(),
                  ))
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.numbers_rounded),
                  SizedBox(width: 5),
                  Text('Gerador de números'),
                ],
              ),
            ),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: ((context) => const NumeroAleatoriosHivePage())))},
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 5),
                  Text('Sair'),
                ],
              ),
            ),
            onTap: () => {
              showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    elevation: 8,
                    title: const Text('Meu App'),
                    content: const Wrap(
                      children: [
                        Text('Deseja sair do aplicativo?'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Não'),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                          },
                          child: const Text(
                            'Sim',
                          ))
                    ],
                  );
                },
              )
            },
          ),
        ],
      ),
    );
  }
}
