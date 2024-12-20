class Cadastro {
  late String nome;
  late String idade;
  late String datadeinicio;
  Cadastro({
    required this.nome,
    required this.idade,
    required this.datadeinicio,
  });
  Cadastro.fromJson(Map<String,dynamic> json) {
    nome = json['nome'];
    idade = json['idade'];
    datadeinicio = json['datadeinicio']
    = json['datadeinicio'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};


    json['nome'] = nome;
    json['idade'] = idade;
    json['datadeinicio'] = datadeinicio;


    return json;


  }
}
