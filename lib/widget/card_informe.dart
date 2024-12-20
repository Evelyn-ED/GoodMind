import 'package:myapp/domain/cardAnamnese.dart';
import 'package:myapp/pages/anamneseDetail.dart';
import 'package:flutter/material.dart';

class CardInforme extends StatefulWidget {
  final CardInforme cardI;

  const CardInforme({
    super.key,
    required this.cardI,
  });

  @override
  State<CardInforme> createState() => _CardInformeState();
}

class _CardInformeState extends State<CardInforme> {
  @override
  Widget build(BuildContext context){
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
          padding: const EdgeInsets.all(16),



          ),

        ],
      ),
    );

  }
}