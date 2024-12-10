import 'package:flutter/material.dart';
import 'package:lydband/pages/cadastro.dart';
import 'package:lydband/pages/login.dart';
import 'package:lydband/pages/logincadastro.dart';
import 'package:lydband/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
