import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lydband/pages/cadastro.dart';
import 'package:lydband/pages/login.dart';

class loginCadastro extends StatefulWidget {
  const loginCadastro({super.key});

  @override
  State<loginCadastro> createState() => _loginCadastroState();
}

class _loginCadastroState extends State<loginCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telaPrimaria(context),
    );
  }
}

SingleChildScrollView telaPrimaria(BuildContext context) {
  return SingleChildScrollView(
      child: Container(
    child: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF405758),
              Color(0xFF212F34),
            ],
          )),
        ),
        Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset("assets/img/logo.png"),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            options(context),
          ],
        )
      ],
    ),
  ));
}

Container options(BuildContext context) {
  return Container(
    child: Center(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => Login())));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 65,
                  color: Color(0xFF132428),
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFFE5E5E5),
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => cadastro())));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 65,
                  color: Color(0xFF657C7D),
                  alignment: Alignment.center,
                  child: Text(
                    "Cadastrar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFFE5E5E5),
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
