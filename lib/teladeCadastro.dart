import 'package:flutter/cupertino.dart';
import 'package:projeto_fran/bancoD/user_dao.dart';
import 'package:projeto_fran/componentesdoApp/decoracion.dart';
import 'package:projeto_fran/domain/User.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterUser> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF5370BB),
          title: const Text(
            'Voltar Para Página de Login',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF33457E),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Registrar usuario',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.elsie(
                      textStyle: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                  ),
                  const SizedBox(height: 80),

                  TextFormField(
                    controller: usernameController,
                    validator: (value){
                      if (value!.length>=3){
                        return null;
                      }else{
                        return "Você precisa digitar seu nome!";
                      }
                    },
                    decoration: getInputDecoration("Nome", Icons.person),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    validator: (value) {
                      if(value!.contains('@')){
                        return null;
                      }else{
                        return "Você precisa digitar um e-mail válido";
                      }
                    },
                    decoration: getInputDecoration("E-mail", Icons.person),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length >= 6) {
                        return null;
                      } else {
                        return "Você precisa digitar uma senha válida!";
                      }
                    },
                    decoration: getInputDecoration("Senha", Icons.password),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    validator: (value) {
                      String password = passwordController.text;
                      if (value!.length >= 6) {
                        return null;
                      } else if (password != value) {
                        return "As senhas precisam ser iguais!";
                      } else {
                        return "Você precisa digitar uma senha válida!";
                      }
                    },
                    decoration: getInputDecoration("Confirme sua senha", Icons.password),
                    cursorColor: const Color(0xFF10397B),
                  ),
                  const SizedBox(height: 32),
                  // Spacer(),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF4058A1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Cadastrar',
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  buildInputDecoration(String name) {
    return InputDecoration(
      label: Text(name),
      floatingLabelStyle: GoogleFonts.montserrat(
          color: const Color(0xFF10397B), fontWeight: FontWeight.w600),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFF10397B),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    // Validar o Form
    if (formKey.currentState!.validate()) {
      // Verificar e-mail e senha
      String username = usernameController.text;
      String email = emailController.text;
      String password = passwordController.text;

      User user = User(username, email, password);
      await UserDao().saveUser(user);
      Navigator.pop(context);
    }
  }
}