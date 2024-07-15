

import 'dart:io';

import 'package:flutter/material.dart';
import 'pages/my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory documentsDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);
  runApp(const MyApp());
}
