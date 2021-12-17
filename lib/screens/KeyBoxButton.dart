import 'dart:async';
import 'package:flutter/material.dart';

class KeyBoxButton extends StatefulWidget {
  Stream stream;
  final double width, height;
  // final String id;

  KeyBoxButton(Key key, this.stream, {this.width = 1, this.height = 1}) : super(key: key);

  @override
  State<StatefulWidget> createState() => KeyBoxButtonState(streamSubscription: stream, width: width, height: height);
}

class KeyBoxButtonState extends State<KeyBoxButton> {
  final double width, height;
  // final String id;
  String text = "";
  bool selected = false;
  Color buttonColor = Colors.transparent;
  Stream streamSubscription;

  KeyBoxButtonState({required this.streamSubscription, this.width = 1, this.height = 1});

  @override
  Widget build(BuildContext context) {
    // keymap[id] = this;  do this but pass keymap?
    streamSubscription.listen((event) {
      if (selected) {
        setState(() {
          text = event;
          selected = false;
          buttonColor = Colors.transparent;
        });
      }
    });

    return Container(
      padding: const EdgeInsets.all(2),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero
        ),
        onPressed: () {
          setState(() {
            selected = !selected;
            buttonColor = selected ? Colors.purple : Colors.transparent;
            // text += "T";
          });},
        child: Container(
          width: width * 50,
          height: height * 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey, width: 2),
              color: buttonColor
          ),
          child: Center(child: Text(text, style: const TextStyle(color: Colors.grey),)),
        ),
      ),
    );
  }


}