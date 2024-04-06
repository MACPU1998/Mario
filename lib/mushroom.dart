import 'package:flutter/material.dart';

class MyMushroom extends StatelessWidget {
  const MyMushroom({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 35,
      width: 35,
      child: Image.asset("assets/images/mushroom.png"),
    );
  }
}
