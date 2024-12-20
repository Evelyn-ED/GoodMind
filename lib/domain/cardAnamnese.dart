class CardAnamnese{

  late  String nome;
  late String idade;
  late String dataNascimento;
  late String sexo;
  late String TMental;
  late String TipoTMental;

  CardAnamnese({
    required this.nome,
    required this.idade,
    required this.dataNascimento,
    required this.sexo,
    required this.TMental,
    required this.TipoTMental,
  });

  CardAnamnese.fromJson(Map<String, dynamic> json){
    nome = json['nome'];
    idade = json['idade'];
    dataNascimento = json['datanascimento'];
    sexo = json['sexo'];
    TipoTMental = json['TipoTMental'];
    TMental = json['TMental'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['nome'] = nome;
    json['idade'] = idade;
    json['dataNascimento'] = dataNascimento;
    json['sexo'] = sexo;
    json['TMental'] = TMental;
    json['TipoTMental'] = TipoTMental;

    return json;

  }

}