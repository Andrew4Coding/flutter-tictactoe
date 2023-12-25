// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TicTacToeTile extends StatelessWidget {
  Function(BuildContext?) addValue;
  final String tileValue;

  TicTacToeTile({
    super.key,
    required this.tileValue,
    required this.addValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        color: Colors.greenAccent,
        onPressed: () {
          addValue(context);
        },
        child: Container(
          child: Text(tileValue,
          style: TextStyle(
            fontSize: 40,
          ),),
        ),
      ),
    );
  }
}
