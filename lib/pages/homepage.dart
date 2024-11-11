import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/widget/cardApresentacao.dart';
import 'package:myapp/domain/cardContainer.dart';
import 'package:myapp/widget/main.dart';
import 'package:myapp/bd/database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/detailpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11114E),
      body: Padding(
        padding: EdgeInsets.all(65),
        child: Center(
          child: ListView(
            children: [
              Text(
                'O que você quer ver por aqui?',
                style: GoogleFonts.elsie(
                  textStyle: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Database.containers.length,
                itemBuilder: (context, i) {
                  return CardApresentacao(
                      cardcontainer: Database.containers[i]);
                },
              ),

              const SizedBox(
                  height: 50),

              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Seguinte',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontStyle: FontStyle.normal
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
