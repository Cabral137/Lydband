import 'package:flutter/material.dart';
import 'package:lydband/Functions/Login.dart';
import 'package:lydband/pages/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telaSecundaria(context),
    );
  }
}

SingleChildScrollView telaSecundaria(BuildContext context) {
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
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            login(context),
          ],
        )
      ],
    ),
  ));
}

Container login(BuildContext context) {
  final emailControler = TextEditingController();
  final senhaControler = TextEditingController();

  return Container(
    child: Center(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF132428),
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 260),
                child: Text(
                  "Email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFFE5E5E5),
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
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
                    color: Color(0xFFBABABA),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: emailControler,
                        style: TextStyle(
                          fontSize: 26,
                        ),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 260),
                child: Text(
                  "Senha",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFFE5E5E5),
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
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
                    color: Color(0xFFBABABA),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextField(
                        controller: senhaControler,
                        style: TextStyle(
                          fontSize: 26,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: "",
                        ),
                        obscureText: true,
                        maxLength: 12,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  if (LoginUser(emailControler.text, senhaControler.text) ==
                      true) {
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                  } else {
                    senhaControler.text = "";
                  }
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
                      width: MediaQuery.of(context).size.width - 230,
                      height: 50,
                      color: Color(0xFF405758),
                      alignment: Alignment.center,
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFFE5E5E5),
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
