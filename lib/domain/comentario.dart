class Comentario {
  late int id;
  late  String nome;
  late  String idade;
  late String comentario;


  Comentario({
    required this.id,
    required this.nome,
    required this.idade,
    required this.comentario,
  });


  Comentario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome =json['nome'];
    idade = json['idade'];
    comentario =json['comentario'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['nome'] = nome;
    json['idade'] = idade;
    json['comentario'] = comentario;
    return json;
  }
}


