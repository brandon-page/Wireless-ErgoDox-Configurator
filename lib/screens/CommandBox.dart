

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommandBox extends StatelessWidget {
  final String text;
  final StreamController changeNotifier;

  const CommandBox(this.text, this.changeNotifier);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey, width: 2),
            color: Colors.black
        ),
        child: ElevatedButton(
          onPressed: () {
            changeNotifier.add(text);
          },
          child: Center(
            child: Text(text, style: const TextStyle(color: Colors.white)),),
        )
    );
  }
}