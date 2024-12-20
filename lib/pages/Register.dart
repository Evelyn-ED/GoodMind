import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled9/bd/database.dart';
import 'package:untitled9/bd/db_helperCadast.dart';
import 'package:untitled9/bd/Cadastro_dao.dart';
import 'package:untitled9/domain/Cadastro.dart';
import 'package:untitled9/pages/tela.dart';


class Register extends StatefulWidget {
  const Register({super.key});


  @override
  State<Register> createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();
  TextEditingController datadeinicioController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: buildBody(),
      ),
    );
  }


  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(children: [
        buildTextFormField(
          controller: nomeController,
          text: 'Nome:',
        ),
        buildTextFormField(
          controller: idadeController,
          text: 'Idade:',
        ),
        buildTextFormField(
          controller: datadeinicioController,
          text: 'Data de Início:',
        ),
        const SizedBox(height: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return TestePage();
                    }
                    ),
                  );
                },
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ))
          ],
        )
      ]),
    );
  }


  buildTextFormField(
      {required TextEditingController controller, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        decoration: buildInputDecoration(text),
        cursorColor: const Color(0),
      ),
    );
  }


  buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xFF010134),
      title: const Text(
        'Cadastro',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }



  Future<void> onPressed() async {
    String nome = nomeController.text;
    String idade = idadeController.text;
    String datadeinicio = datadeinicioController.text;


    Cadastro cadastro = Cadastro(
      nome: nome,
      idade: idade,
      datadeinicio: datadeinicio,
    );
    await CadastroDao().salvarCadastro(cadastro);
    Navigator.pop(context);
  }

  buildInputDecoration(String name) {
    return InputDecoration(
      label: Text(name),
      floatingLabelStyle: GoogleFonts.montserrat(color: const Color(0),
      fontWeight: FontWeight.w600,
    ),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
    width: 2,
    color: Color(0),
    ),
    ),
    );
  }
}

