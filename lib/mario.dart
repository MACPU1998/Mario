import 'dart:math';
import 'package:flutter/material.dart';

class MyMario extends StatelessWidget {
  final Direction;
  final midrun;
  final size;

  const MyMario({super.key, this.Direction, this.midrun,this.size});

  @override
  Widget build(BuildContext context) {
    if (Direction == "right") {
      return Container(
        width: size,
        height: size,
        child: midrun
            ? Image.asset("assets/images/mario.png")
            : Image.asset("assets/images/mario_run.png"),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: size,
          height: size,
          child:  midrun
              ? Image.asset("assets/images/mario.png")
              : Image.asset("assets/images/mario_run.png"),
        ),
      );
    }
  }
}
