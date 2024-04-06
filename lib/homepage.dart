import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mario/button.dart';
import 'package:mario/jumpingmario.dart';
import 'package:mario/mario.dart';
import 'package:mario/mushroom.dart';
import 'package:mario/styles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static double marioX = 0;
  static double marioY = 1;
  double marioSize = 50;
  double time = 0;
  double height = 0;
  double initialHeight = marioY;
  double mushroomX = 0.5;
  double mushroomY = 1;
  String direction = "right";
  bool midrun = false;
  bool midjump = false;

  void checkIfAteMushroom() {
    if ((marioX - mushroomX).abs() < 0.05 &&
        (marioY - mushroomY).abs() < 0.05) {
      setState(() {
        //if eaten , move mushroom off the screen
        mushroomX=2;
        //if eaten , mario size is bigger than before
        marioSize=80;
      });
    }
  }

  void preJump() {
    time = 0;
    initialHeight = marioY;
  }

  void jump() {
    // this first if statement disables the double jump
    if (midjump == false) {
      midjump = true;
      preJump();
      Timer.periodic(Duration(milliseconds: 50), (timer) {
        time += 0.05;
        height = -4.9 * time * time + 5 * time;

        if (initialHeight - height > 1) {
          midjump = false;
          setState(() {
            marioY = 1;
          });
          timer.cancel();
        } else {
          setState(() {
            marioY = initialHeight - height;
          });
        }
      });
    }
  }

  void moveRight() {
    direction = "right";
    checkIfAteMushroom();
    Timer.periodic(Duration(milliseconds: 5), (timer) {
      checkIfAteMushroom();
      if (MyButton().userIsHoldingButton() == true && (marioX + 0.02) <1) {
        setState(() {
          marioX += 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });

    setState(() {
      marioX += 0.02;
    });
  }

  void moveLeft() {
    direction = "left";
    checkIfAteMushroom();
    Timer.periodic(Duration(milliseconds: 5), (timer) {
      checkIfAteMushroom();
      if (MyButton().userIsHoldingButton() == true && (marioX + 0.02)>-1) {
        setState(() {
          marioX -= 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    color: Colors.blue,
                    child: AnimatedContainer(
                      alignment: Alignment(marioX, marioY),
                      duration: const Duration(milliseconds: 0),
                      child: midjump
                          ? JumpingMario(
                              direction: direction,
                        size: marioSize,
                            )
                          : MyMario(
                              Direction: direction,
                              midrun: midrun,
                              size: marioSize,
                            ),
                    ),
                  ),
                  Container(
                      alignment: Alignment(mushroomX, mushroomY),
                      child: MyMushroom()),
                  Padding(
                    padding: EdgeInsets.only(top: size.height / 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "MARIO",
                              style: MyTextStyles.headerText,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text("0000", style: MyTextStyles.headerText),
                          ],
                        ),
                        Column(
                          children: [
                            Text("WORLD", style: MyTextStyles.headerText),
                            const SizedBox(
                              height: 8,
                            ),
                            Text("1-1", style: MyTextStyles.headerText),
                          ],
                        ),
                        Column(
                          children: [
                            Text("TIME", style: MyTextStyles.headerText),
                            const SizedBox(
                              height: 8,
                            ),
                            Text("999", style: MyTextStyles.headerText),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
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
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    function: moveLeft,
                  ),
                  MyButton(
                    child: const Icon(Icons.arrow_upward, color: Colors.white),
                    function: jump,
                  ),
                  MyButton(
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                    function: moveRight,
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
