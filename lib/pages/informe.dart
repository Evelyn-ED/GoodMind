import 'package:myapp/db/card_dao.dart';
import 'package:myapp/domain/cardAnamnese.dart';
import 'package:myapp/pages/anamnese.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InformePage extends StatefulWidget {
  const InformePage({super.key});

  @override
  State<InformePage> createState() => _InformePageState();
}

class _InformePageState extends State<InformePage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController sexoController = TextEditingController();
  TextEditingController TMentalController = TextEditingController();
  TextEditingController TipoTMentalController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          buildTextFormField(
            controller: nomeController,
            text: 'Nome:',
          ),
        ],
      ),
    );
  }

  buildTextFormField({
    required TextEditingController controller,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.lightBlue, width: 3),
          )
        ),
        cursorColor: const Color(0xff10397B),

      ),
    );
  }

  Future<void> onPressed() async{
    String nome = nomeController.text;
    String idade = idadeController.text;
    String dataNascimento = dataNascimentoController.text;
    String sexo = sexoController.text;
    String TMental = TMentalController.text;
    String TipoTMental = TipoTMentalController.text;

  }
}
