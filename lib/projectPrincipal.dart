import 'package:flutter/material.dart';
import 'package:GoodMind/bd/shared_prefs.dart';
import 'package:GoodMind/bd/user_dao.dart';
import 'package:GoodMind/segundaTela.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:GoodMind/componentesdoApp/decoracion.dart';
import 'package:GoodMind/teladeCadastro.dart';


class Projeto extends StatefulWidget {
  const Projeto({super.key});


  @override
  State<Projeto> createState() => _ProjetoState();
}


class _ProjetoState extends State<Projeto> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF33457E),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Form(
              key: formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      'Login',
                      style: GoogleFonts.elsie(
                        textStyle: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if(value!.contains('@')){
                          return null;
                        }else{
                          return 'Você precisa digitar um e-mail válido';
                        }
                      },
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: getInputDecoration("E-mail", Icons.person),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null) {
                          return 'A senha não pode ser vazia';
                        }
                        if (value.length < 6) {
                          return 'A senha deve conter pelo menos 6 caracteres';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: getInputDecoration("Senha", Icons.password),
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Esqueceu a senha? Clique aqui',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          String email = emailController.text;
                          String password = passwordController.text;
                          if(email == "fas23@aluno.ifal.edu.br" &&
                              password == "123456") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return TestePage();
                              },
                              ),
                            );
                          }
                        }
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF4058A1),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),

                    Text('Ainda não tem uma conta? Crie agora',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(color: Colors.lightBlueAccent, fontSize: 15),
                        )
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return RegisterUser();
                          },
                          ),
                        );
                      },
                      child: const Text(
                        'Criar uma Conta',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFF4058A1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  buildInputDecoration(String name) {
    return InputDecoration(
      label: Text(name),
      floatingLabelStyle: GoogleFonts.montserrat(
          color: const Color(0xFFDFC8BC), fontWeight: FontWeight.w600),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFFDFC8BC),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    if (formKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;

      bool auth = await UserDao().autenticar(email, password);

      if (auth) {
        SharedPrefs().setUser(true);

        // Navegar p/ paginaPrincipaldeTeste
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return TestePage();
            },
          ),
        );
      } else {
        print('Usuário e/ou Senha incorreto(s)!');
      }
    }
  }


}