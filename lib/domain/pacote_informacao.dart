class PacoteInformacao {
  late int id;
  late String urlImage;
  late String titulo1;
  late String descricao;


  PacoteInformacao({
    required this.id,
    required this.titulo1,
    required this.descricao,
    required this.urlImage,
  });


  PacoteInformacao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo1 = json['titulo1'];
    descricao = json['descricao'];
    urlImage = json['urlImage'];
  }


  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['titulo1'] = titulo1;
    json['descricao'] = descricao;
    json['urlImage'] = urlImage;
    return json;
  }
}
