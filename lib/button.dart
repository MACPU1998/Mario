import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final child;
  final function;
  static bool holdingButton = false;

  MyButton({super.key, this.child, this.function});

  bool userIsHoldingButton() {
    return holdingButton;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: function,
      onTapDown: (details) {
        holdingButton=true;
        function();
      },
      onTapUp: (details) {
        holdingButton=false;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.brown[300],
            child: child),
      ),
    );
  }
}
