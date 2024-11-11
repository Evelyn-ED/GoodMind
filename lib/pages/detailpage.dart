import 'package:flutter/material.dart';
import 'package:myapp/domain/cardContainer.dart';

class Detailpage extends StatefulWidget {
  final CardContainer cardContainer;

  const Detailpage({super.key, required this.cardContainer});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  CardContainer get cardContainer => widget.cardContainer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( child: Text('data'),),
    );

  }
}
