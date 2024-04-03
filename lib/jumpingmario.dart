import 'package:flutter/material.dart';

class JumpingMario extends StatelessWidget {
  const JumpingMario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
    height: 50,
    child: Image.asset("assets/images/mario_jump.png"),
    );
  }
}
