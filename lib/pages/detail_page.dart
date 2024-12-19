import 'package:flutter/material.dart';
import 'package:prova/domain/comentario.dart';
import 'package:prova/bd/pacote_informacao_dao.dart';
import 'package:prova/domain/pacote_informacao.dart';
import 'package:prova/bd/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';








class DetailPage extends StatefulWidget {
  final PacoteInformacao pacoteInformacao;




  const DetailPage({super.key, required this.pacoteInformacao});




  @override
  State<DetailPage> createState() => _DetailPageState();
}






class _DetailPageState extends State<DetailPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();




  void _submitComment() async {
    final name = _nameController.text;
    final age = _ageController.text;
    final comment = _commentController.text;




    if (name.isEmpty || age.isEmpty || comment.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
      return;
    }




    Comentario comentario = Comentario(
      nome: name,
      idade: age,
      comentario: comment,
    );




    await Comentario().salvarComentario(comentario);




    _nameController.clear();
    _ageController.clear();
    _commentController.clear();




    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Comentário enviado com sucesso!')),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF10397B),
        title: const Text(
          'Voltar Para tela inicial',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'ANSIEDADE',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Text(
                      'A ansiedade é uma reação temporária e normal do corpo a situações que causam preocupação ou medo, como precisar fazer uma apresentação em público, ter uma entrevista de emprego ou fazer um exame na escola. No entanto, quando a ansiedade é intensa, surge sem motivo aparente e atrapalha as tarefas diárias, pode indicar um transtorno de ansiedade como o transtorno de ansiedade generalizada, transtorno de pânico ou fobia. Em caso de ansiedade, especialmente se os sintomas forem frequentes ou intensos, é recomendado consultar o psiquiatra para uma avaliação. Quando indicado, o tratamento da ansiedade pode envolver psicoterapia e o uso de medicamentos como ansiolíticos e antidepressivos.',                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'DEPRESSÃO',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Text(
                      'A depressão é um transtorno psicológico caracterizado por tristeza persistente e falta de interesse para realizar atividades que antes eram consideradas divertidas.Embora a tristeza seja uma emoção normal, na depressão essa tristeza é tão forte e dura por tanto tempo, que acaba afetando toda a vida da pessoa, podendo impedir a realização de tarefas básicas como dormir ou comer e, em alguns casos, levar a pessoa a ter vontade de morrer. A depressão tem cura, mas o tratamento é demorado e pode incluir psicoterapia, medicamentos, convulsoterapia e algumas terapias naturais.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'SÍNDROME DO PÂNICO',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Text(
                      'A síndrome do pânico é caracterizada por crises repentinas e frequentes de medo extremo e pavor, que provocam sintomas que podem durar entre 10 e 30 minutos, como suor frio, aumento dos batimentos cardíacos, tremores, falta de ar, palidez e desmaio, em alguns casos.As crises do transtorno do pânico fazem com que a pessoa não leve uma vida normal, pois tem medo de que as crises voltem e, por isso, evitam situações de perigo. Por exemplo, se a crise ocorreu em um elevador, é comum que a pessoa não queira mais voltar a utilizar o elevador no trabalho ou em casa.É importante que a pessoa que possui crises de pânico seja acompanhada por um psicólogo e psiquiatra para que seja possível ser iniciado o uso de medicamentos adequados para aliviar os sintomas, bem como a realização de terapia para ajudar a evitar novas crises.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Informe seu nome:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Informe sua idade:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Idade',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Escreva o que você sente:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _commentController,
                  decoration: const InputDecoration(
                    labelText: 'Escreva aqui!',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitComment,
                    child: const Text('Enviar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
