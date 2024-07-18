import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/list_view.dart';
import 'package:trilhaapp/pages/list_view_horizontal.dart';
import 'package:trilhaapp/pages/tarefa_page/tarefa_hive_page.dart';
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
          //? Cor do icone do Drawer
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
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
                children: const [CardPage(), ImageAssestsPage(), ListViewPage(), ListViewHorizontal(), TarefaHivePage()],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
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
                  BottomNavigationBarItem(
                    label: 'page 4',
                    icon: Icon(Icons.image),
                  ),
                  BottomNavigationBarItem(
                    label: 'Tarefas',
                    icon: Icon(Icons.list),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
