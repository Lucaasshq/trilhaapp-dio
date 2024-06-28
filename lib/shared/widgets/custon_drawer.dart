import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                child: const Text('Dados cadastráis'),
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
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                child: const Text('Termos de uso e privacidade'),
              ),
              onTap: () => {},
            ),
            const Divider(),
            InkWell(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                child: const Text('Configurações'),
              ),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
