import 'dart:math';

import 'package:flutter/material.dart';

class JumpingMario extends StatelessWidget {

  final direction;
   const JumpingMario({super.key, this.direction});

  @override
  Widget build(BuildContext context) {

    if(direction=="right"){
      return Container(
        width: 50,
        height: 50,
        child: Image.asset("assets/images/mario_jump.png"),
      );
    }else{
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: 50,
          height: 50,
          child: Image.asset("assets/images/mario_jump.png"),
        ),
      );
    }

  }
}
