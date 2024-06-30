import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key});

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(
                  child: Image.asset(
                    AppImages.paisagem1,
                    height: 100,
                  ),
                ),
                Card(
                  child: Image.asset(
                    AppImages.paisagem2,
                    height: 100,
                  ),
                ),
                Card(
                  child: Image.asset(
                    AppImages.paisagem3,
                    height: 100,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          )
        ],
      ),
    );
  }
}
