class musicaModel {
  String ID;
  String pathImagem;
  String nome;
  String artista;
  double nota;

  musicaModel({
    required this.ID,
    required this.pathImagem,
    required this.nome,
    required this.artista,
    required this.nota,
  });

  factory musicaModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": String ID,
        "nome": String nome,
        "url_foto": String pathImagem,
        "artista_principal": String artista,
        "nota": double nota,
      } =>
        musicaModel(
            ID: ID,
            pathImagem: pathImagem,
            nome: nome,
            artista: artista,
            nota: nota),
      // TODO: Handle this case.
      Map<String, dynamic>() => throw UnimplementedError(),
    };
  }
}
