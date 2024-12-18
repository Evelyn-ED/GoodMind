import 'package:projeto_fran/bancoD/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:projeto_fran/projectPrincipal.dart';
import 'package:projeto_fran/segundaTela.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    bool isAuth = await SharedPrefs().getUser();
    await Future.delayed(const Duration(seconds: 3));

    if (isAuth) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return TestePage();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Projeto();
          },
        ),
      );
    }


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF233E7D),
      child: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Logo-hurb-branca-bg-azul.jpg/440px-Logo-hurb-branca-bg-azul.jpg'),
    );
  }
}