import 'package:myapp/domain/cardAnamnese.dart';
import 'package:myapp/pages/anamnese.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Anamnesedetail extends StatefulWidget {
  final CardAnamnese cardAnamnese;

  const Anamnesedetail({super.key, required this.cardAnamnese});

  @override
  State<Anamnesedetail> createState() => _AnamneseDetailState();
}

class _AnamneseDetailState extends State<Anamnesedetail> {
  CardAnamnese get cardAnamnese => widget.cardAnamnese;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardAnamnese.nome,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  cardAnamnese.idade,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
