// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String varTitle;
  final bool varStatus;
  final int myIndex;
  final Function changeStatus;
  final Function deleteTask;

  const TodoCard(
      {super.key,
      required this.varTitle,
      required this.varStatus,
      required this.myIndex,
      required this.changeStatus,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(myIndex);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(209, 224, 224, 0.2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                varTitle,
                style: TextStyle(
                    fontSize: 25,
                    color: !varStatus ? Colors.white : Colors.black,
                    decoration: !varStatus
                        ? TextDecoration.none
                        : TextDecoration.lineThrough),
              ),
              Row(
                children: [
                  Icon(
                    varStatus ? Icons.check : Icons.close,
                    color: varStatus ? Colors.green : Colors.red,
                    size: 28,
                    // varStatus ? Icons.check : Icons.close,
                    // color: varStatus ? Colors.green : Colors.red,
                    // size: 27,
                  ),
                  SizedBox(
                    width: 17.0,
                  ),
                  IconButton(
                    onPressed: () {
                      deleteTask(myIndex);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[100],
                      size: 28,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
