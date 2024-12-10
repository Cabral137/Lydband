class destaqueModel {
  String ID;
  String pathImagem;
  String nome;
  String artista;
  String tipo;
  double nota;

  destaqueModel({
    required this.ID,
    required this.pathImagem,
    required this.nome,
    required this.artista,
    required this.tipo,
    required this.nota,
  });

  factory destaqueModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": String ID,
        "nome": String nome,
        "url_foto": String pathImagem,
        "artista_principal": String artista,
        "tipo_destaque": String tipo,
        "nota": double nota,
      } =>
        destaqueModel(
            ID: ID,
            pathImagem: pathImagem,
            nome: nome,
            artista: artista,
            tipo: tipo,
            nota: nota),
      // TODO: Handle this case.
      Map<String, dynamic>() => throw UnimplementedError(),
    };
  }
}
