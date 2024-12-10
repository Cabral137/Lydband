// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:lydband/Functions/GetElementsAPI.dart';
import 'package:lydband/Functions/Login.dart';
import 'package:lydband/models/DestaquesModel.dart';
import 'package:lydband/models/MusicaModel.dart';
import 'package:lydband/models/AlbumDestaqueModel.dart';
import "package:flutter_svg/flutter_svg.dart";
import "package:flutter/material.dart";
import 'package:lydband/pages/logincadastro.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _ativo = false;

  int indicePagina = 0;
  late PageController pc;

  setPagina(pagina) {
    setState(() {
      indicePagina = pagina;
    });
  }

  Future _loadResourcesAlbuns() async {
    return await getAlbunsDestaques();
  }

  Future _loadResourcesDestaque() async {
    return await getDestaque();
  }

  Future _loadResourcesMusicas() async {
    return await getMusicasDestaques();
  }

  @override
  Widget build(BuildContext context) {
    pc = PageController(initialPage: indicePagina);

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      backgroundColor: Color(0xFF212F34),
      appBar: linhazinha(),
      body: body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: navigationBar(),
    );
  }

  SingleChildScrollView body() {
    return SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF405758),
                Color(0xFF212F34),
              ],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                appBar(),
                SizedBox(height: 35),
                albunsRecomendados(),
                SizedBox(height: 30),
                destaques(),
                SizedBox(height: 40),
                //musicasPopulares(),
                SizedBox(height: 1000),
              ],
            )));
  }

  AppBar linhazinha() {
    return AppBar(
      backgroundColor: Color(0xFF212F34),
      toolbarHeight: 0,
    );
  }

  Row appBar() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (isUserConnected() != true) {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => loginCadastro())));
            }
            //Navigator.pushNamed(context, '/home');
          },
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 2),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/img/Usuario.jpg")),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 196,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            width: 35,
            height: 35,
            child: SvgPicture.asset("assets/icons/Sino.svg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            width: 35,
            height: 35,
            child: SvgPicture.asset("assets/icons/Configuracao.svg"),
          ),
        ),
      ],
    );
  }

  Container albunsRecomendados() {
    return Container(
      height: 260,
      child: Column(
        children: [getTitulo("Álbuns Recomendados"), Spacer(), albunsBody()],
      ),
    );
  }

  Container destaques() {
    return Container(
      height: 200,
      child: Column(
        children: [getTitulo("Destaques"), Spacer(), destaquesBody()],
      ),
    );
  }

  Container musicasPopulares() {
    return Container(
      height: 355,
      child: Column(
        children: [getTitulo("Músicas Populares"), Spacer(), musicasBody()],
      ),
    );
  }

  Container getTitulo(String titulo) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(
          titulo,
          style: TextStyle(
              color: Color(0xFFE5E5E5),
              fontSize: 28,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Container albunsBody() {
    return Container(
      height: 210,
      child: FutureBuilder(
          future: _loadResourcesAlbuns(),
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.separated(
                  itemCount: snap.data.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 15,
                      ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(alignment: Alignment.bottomRight, children: [
                            Container(
                              decoration: BoxDecoration(
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
                                borderRadius: BorderRadius.circular(3),
                                child:
                                    Image.network(snap.data[index].pathImagem),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 4, 4, 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF282625).withOpacity(0.95),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 2, 12, 2),
                                  child: Text(
                                    snap.data[index].nota.toString(),
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          ]),
                          SizedBox(height: 2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snap.data[index].nome,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xFFE5E5E5),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                snap.data[index].artista,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xFFBABABA),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Container();
            }
          }),
    );
  }

  Padding destaquesBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: FutureBuilder(
          future: _loadResourcesDestaque(),
          builder: (context, snap) {
            if (snap.hasData) {
              return Container(
                height: 150,
                width: 410,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 30, 40, 41),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(0, 4))
                    ]),
                child: Row(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        child: Image.network(snap.data.pathImagem),
                      ),
                    ),
                    Container(
                      height: 150,
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(110, 2, 5, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color.fromARGB(255, 58, 71, 71)),
                              padding:
                                  EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                              child: Text(snap.data.tipo,
                                  style: TextStyle(
                                      color: Color(0xFFE5E5E5),
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Inter',
                                      fontSize: 12)),
                            ),
                          ),
                          Spacer(),
                          Text(
                            snap.data.nome,
                            style: TextStyle(
                              color: Color(0xFFE5E5E5),
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                          Text(
                            snap.data.artista,
                            style: TextStyle(
                              height: 0.5,
                              color: Color(0xFFBABABA),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Container(
                                child: SvgPicture.asset(
                                    "assets/icons/Estrelas.svg"),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                snap.data.nota.toString(),
                                style: TextStyle(
                                  color: Color(0xFFBABABA),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 2),
                                child: Container(
                                    height: 28,
                                    width: 28,
                                    child: SvgPicture.asset(
                                        "assets/icons/Save.svg")),
                              ),
                            ],
                          ),
                          Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          }),
    );
  }

  Container musicasBody() {
    return Container(
      height: 310,
      child: FutureBuilder(
          future: _loadResourcesMusicas(),
          builder: (context, snap) {
            if (snap.hasData) {
              return ListView.separated(
                  itemCount: snap.data.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 15,
                      ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(alignment: Alignment.topLeft, children: [
                            Container(
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
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
                                  borderRadius: BorderRadius.circular(15),
                                  child: FittedBox(
                                      fit: BoxFit.cover,
                                      clipBehavior: Clip.hardEdge,
                                      child: Image.network(
                                          snap.data[index].pathImagem)),
                                )),
                            Container(
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(0, 0, 0, 0),
                                      Color.fromARGB(255, 0, 0, 0)
                                          .withOpacity(0.70),
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF282625).withOpacity(0.95),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 2, 12, 2),
                                  child: Text(
                                    snap.data[index].nota.toString(),
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(133, 215, 2, 2),
                              child: Container(
                                  height: 28,
                                  width: 28,
                                  child: SvgPicture.asset(
                                      "assets/icons/Save.svg")),
                            ),
                          ]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snap.data[index].nome,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xFFE5E5E5),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                snap.data[index].artista,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xFFBABABA),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Container();
            }
          }),
    );
  }

  Container navigationBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0x00141D20).withOpacity(0.05),
            Color(0xFF0C1417).withOpacity(0.70),
            Color(0xFF050D10),
            Color(0xFF02080A)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            tooltip: 'Increment',
            onPressed: () {},
            child:
                const Icon(Icons.home_rounded, color: Colors.white, size: 32),
          ),
          SizedBox(
            width: 80,
          ),
          FloatingActionButton(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            tooltip: 'Increment',
            onPressed: () {},
            child: const Icon(Icons.search, color: Colors.white, size: 32),
          ),
          SizedBox(
            width: 80,
          ),
          FloatingActionButton(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            tooltip: 'Increment',
            onPressed: () {},
            child: const Icon(Icons.bookmarks_outlined,
                color: Colors.white, size: 32),
          ),
        ],
      ),
    );
  }
}
