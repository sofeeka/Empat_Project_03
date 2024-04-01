import 'package:flutter/material.dart';

import '../themes/colors.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  void buttonPressed() {
    setState(() {
      colorIndex++;
    });
  }

  int colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: buttonPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                bookCardButtonColorList[colorIndex % bookCardButtonColorList.length],
              ),
            ),
            child: Text(
              colorIndex == 0 ? 'PressMe' : 'I Change state',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
