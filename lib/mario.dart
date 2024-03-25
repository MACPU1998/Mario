import 'package:flutter/material.dart';

class MyMario extends StatelessWidget {
  const MyMario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: Image.asset("assets/images/mario.png"),
    );
  }
}
