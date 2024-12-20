import 'package:flutter/material.dart';
import 'package:myapp/widget/card_informe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:myapp/db/card_dao.dart';
import 'package:myapp/pages/informe.dart';
import 'package:myapp/domain/cardAnamnese.dart';
import 'package:myapp/pages/anamneseDetail.dart';
import 'package:myapp/widget/main.dart';

class Anamnese extends StatefulWidget {
  const Anamnese({super.key});

  @override
  State<Anamnese> createState() => _AnamneseState();
}

class _AnamneseState extends State<Anamnese> {
  List<CardAnamnese> card = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    card = await CardDao().listCards();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          buildEnfeite(),
          buildCardAvaliacao(),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: card.length,
            itemBuilder: (context, i) {
            },
          ),
        ],
      ),
    );
  }

  buildEnfeite() {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.blueAccent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Dados Pessoais',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xFF10397B),
      title: const Text(
        'Ficha de Anamnese',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}

buildCardAvaliacao() {
  return Padding(
    padding: EdgeInsets.all(15),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'aaaaaaaa',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.lightBlue, width: 3),
            ),
          ),
          ),
        );

}
