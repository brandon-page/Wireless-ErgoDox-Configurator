
import 'package:flutter/material.dart';

class KeyBox extends StatelessWidget {
  final double width, height;
  final String text;

  // const KeyBox({this.text = "", this.width = 1, this.height = 1});
  const KeyBox(this.text, {this.width = 1, this.height = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: Container(
        width: width * 50,
        height: height * 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 2)
        ),
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(text, style: const TextStyle(color: Colors.grey),)),
      )
    );
  }
}