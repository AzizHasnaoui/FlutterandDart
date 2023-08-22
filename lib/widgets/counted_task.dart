// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int varAllTasks;
  final int allCompleted;

  const Counter(
      {super.key, required this.varAllTasks, required this.allCompleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Text(
        " $allCompleted/$varAllTasks",
        style: TextStyle(
          fontSize: 44,
          fontWeight: FontWeight.bold,
          color: allCompleted == varAllTasks ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
