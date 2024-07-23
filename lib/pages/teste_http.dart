// ignore_for_file: avoid_unnecessary_containers
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpTestePage extends StatefulWidget {
  const HttpTestePage({super.key});

  @override
  State<HttpTestePage> createState() => _HttpTestePageState();
}

class _HttpTestePageState extends State<HttpTestePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(),
        floatingActionButton: FloatingActionButton(onPressed: () {http.get()}),
      ),
    );
  }
}
