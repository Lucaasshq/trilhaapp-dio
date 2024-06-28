import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
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
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
            onTap: () => {},
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
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
