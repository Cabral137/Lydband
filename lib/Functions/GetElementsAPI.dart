import 'dart:convert';
import 'package:http/http.dart';
import 'package:lydband/models/AlbumDestaqueModel.dart';
import 'package:lydband/models/DestaquesModel.dart';
import 'package:lydband/models/MusicaModel.dart';

String IP = "localhost:42069";

Future<List<albumModel>> getAlbunsDestaques() async {
  final response = await get(Uri.parse("http://" + IP + "/albunsRecomendados"));

  if (response.statusCode == 200) {
    List<albumModel> albunsDestacados = json
        .decode(utf8.decode(response.bodyBytes))["albuns"]
        .map((data) => albumModel.fromJson(data))
        .cast<albumModel>()
        .toList();

    return albunsDestacados;
  } else {
    return [];
  }
}

Future<List<musicaModel>> getMusicasDestaques() async {
  final response =
      await get(Uri.parse("http://" + IP + "/musicasRecomendadas"));

  if (response.statusCode == 200) {
    List<musicaModel> musicasDestacadas = json
        .decode(utf8.decode(response.bodyBytes))["musicas"]
        .map((data) => musicaModel.fromJson(data))
        .cast<musicaModel>()
        .toList();

    return musicasDestacadas;
  } else {
    return [];
  }
}

Future<destaqueModel> getDestaque() async {
  final response = await get(Uri.parse("http://" + IP + "/destaque"));

  if (response.statusCode == 200) {
    return destaqueModel.fromJson(
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);
  } else {
    return destaqueModel(
        ID: "Bolas",
        pathImagem: "Bolas",
        nome: "nome",
        artista: "artista",
        tipo: "tipo",
        nota: 4.7);
  }
}
