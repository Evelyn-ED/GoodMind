import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/domain/cardContainer.dart';

class CardApresentacao extends StatefulWidget {
  final CardContainer cardcontainer;

  const CardApresentacao({super.key, required this.cardcontainer});

  @override
  State<CardApresentacao> createState() => _CardApresentacaoState();
}

class _CardApresentacaoState extends State<CardApresentacao> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        width: 500,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)
        ),
        margin: EdgeInsets.only(top: 10, bottom: 10),

        child: ListTile(
          title: Text(
            widget.cardcontainer.nome,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
