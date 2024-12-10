import 'package:flutter/material.dart';

class cadastro extends StatefulWidget {
  const cadastro({super.key});

  @override
  State<cadastro> createState() => _cadastroState();
}

class _cadastroState extends State<cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telaTerciaria(context),
    );
  }
}

SingleChildScrollView telaTerciaria(BuildContext context) {
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
            cadrastro(context),
            SizedBox(
              height: 100,
            )
          ],
        )
      ],
    ),
  ));
}

Container cadrastro(BuildContext context) {
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
              campoCadastro(context, "Nome", false),
              SizedBox(height: 20),
              campoCadastro(context, "Username", false),
              SizedBox(height: 20),
              campoCadastro(context, "Email", false),
              SizedBox(height: 20),
              campoCadastro(context, "Data de Nascimento", false),
              SizedBox(height: 20),
              campoCadastro(context, "Senha", true),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {},
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
                      width: MediaQuery.of(context).size.width - 150,
                      height: 50,
                      color: Color(0xFF405758),
                      alignment: Alignment.center,
                      child: Text(
                        "Cadastrar",
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

Container campoCadastro(BuildContext context, String texto, bool senha) {
  return Container(
    child: Column(
      children: [
        Text(
          texto,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFE5E5E5),
              fontSize: 26,
              fontWeight: FontWeight.bold),
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
                  controller: TextEditingController(text: ""),
                  style: TextStyle(
                    fontSize: 26,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: "",
                  ),
                  obscureText: senha,
                  maxLength: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
