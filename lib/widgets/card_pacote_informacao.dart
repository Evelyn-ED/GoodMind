import 'package:prova/domain/pacote_informacao.dart';
import 'package:prova/pages/detail_page.dart';
import 'package:flutter/material.dart';


class CardPacoteInformacao extends StatefulWidget {
  final PacoteInformacao pacoteInformacao;


  const CardPacoteInformacao({
    super.key,
    required this.pacoteInformacao,
  });


  @override
  State<CardPacoteInformacao> createState() => _CardPacoteInformacaoState();
}


class _CardPacoteInformacaoState extends State<CardPacoteInformacao> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
          color: Colors.white,
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.pacoteInformacao.urlImage),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.pacoteInformacao.titulo1,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.pacoteInformacao.descricao,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1668ad)),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          )),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              var detailPage = DetailPage(
                pacoteInformacao: widget.pacoteInformacao,
              );
              return detailPage;
            },
          ),
        );
      },
    );
  }
}