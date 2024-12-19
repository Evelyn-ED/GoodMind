import 'dart:async';


import 'package:prova/bd/database.dart';
import 'package:prova/bd/pacote_informacao_dao.dart';
import 'package:prova/domain/pacote_informacao.dart';
import 'package:prova/pages/detail_page.dart';
import 'package:prova/widgets/card_pacote_informacao.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff05223a),
      appBar: AppBar(
        backgroundColor: const Color(0xFF10397B),
        title: const Text(
          'Comece sua experiencia por aqui',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF10397B),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.self_improvement,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.bedtime_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.account_circle, color: Colors.white, size: 30),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Database.pacotes.length,
            itemBuilder: (context, i) {
              return CardPacoteInformacao(
                pacoteInformacao: Database.pacotes[i],
              );
            },
          ),
        ],
      ),
    );
  }
}
