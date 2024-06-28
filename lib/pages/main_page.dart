import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/page_1.dart';
import 'package:trilhaapp/pages/page_2.dart';
import 'package:trilhaapp/pages/page_3.dart';
import 'package:trilhaapp/shared/widgets/custon_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main Page'),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: const [
                  Page1Pagina(),
                  Page2Pagina(),
                  Page3Pagina(),
                ],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                    label: 'page 1',
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: 'page 2',
                    icon: Icon(Icons.add),
                  ),
                  BottomNavigationBarItem(
                    label: 'page 3',
                    icon: Icon(Icons.person),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
