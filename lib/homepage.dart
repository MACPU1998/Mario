import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mario/button.dart';
import 'package:mario/mario.dart';
import 'package:mario/styles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double marioX=0;
  double marioY=1;

  void jump(){
    Timer.periodic(Duration(milliseconds: 50), (timer) { });
  
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.blue,
                child: AnimatedContainer(
                  alignment: Alignment(marioX,marioY),
                  duration: Duration(milliseconds: 0),
                  child: MyMario(),
                ),
              )),
          Container(
            height: 10,
            color: Colors.green,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    child: const Icon(Icons.arrow_back,color: Colors.white,),
                  ),
                  MyButton(
                    child: const Icon(Icons.arrow_upward,color: Colors.white),
                  ),
                  MyButton(
                    child: const Icon(Icons.arrow_forward,color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
