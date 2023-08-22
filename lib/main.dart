// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/counted_task.dart';
import 'package:todo_app/widgets/todo_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _MyWidgetState();
}

// class for task(todo-card)
class Task {
  String title;
  bool status;

  Task({required this.title, required this.status});
}

class _MyWidgetState extends State<TodoApp> {
  // Create controller to  get the text inside the textfield  in the dialog widget
  final myController = TextEditingController();

  // list of todos
  List allTasks = [];

// To calculate only completed todos
  int callculateTrue() {
    int completedTask = 0;

    allTasks.forEach((item) {
      if (item.status) {
        completedTask++;
      }
    });
    return completedTask;
  }

// To change the state of the todo (completed or not completed) when click on the todo
  changeStatus(int taskIndex) {
    setState(() {
      allTasks[taskIndex].status = !allTasks[taskIndex].status;
    });
  }

// To add new todo when clicking on "ADD" in the dialog widget
  addTask() {
    setState(() {
      allTasks.add(Task(title: myController.text, status: false));
    });
  }

// To remove todo  when clicking on "delete" icon
  deleteTask(int myIndex) {
    setState(() {
      allTasks.remove(allTasks[myIndex]);
    });
  }

// To remove all todos  when clicking on "delete" icon in the appBar
  deleteAllTask() {
    setState(() {
      allTasks.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              deleteAllTask();
            },
            icon: Icon(Icons.delete_forever),
            color: Colors.red[100],
            iconSize: 33,
          ),
        ],
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 55, 63, 82),
        title: Text(
          "TO DO APP",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // TodoCard()
              Counter(
                varAllTasks: allTasks.length,
                allCompleted: callculateTrue(),
              ),

              Container(
                margin: EdgeInsets.only(
                  top: 22,
                ),
                padding: EdgeInsets.only(bottom: 20.0),
                color: Color.fromARGB(255, 55, 63, 82),
                height: 580,
                child: ListView.builder(
                  itemCount: allTasks.length,
                  itemBuilder: (context, index) {
                    return TodoCard(
                      // I will pass all these information when create the Todocard() widget in "todo_card.dart" file

                      varTitle: allTasks[index].title,
                      varStatus: allTasks[index].status,
                      changeStatus: changeStatus,
                      deleteTask: deleteTask,
                      myIndex: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                child: Container(
                  height: 200,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        maxLength: 30,
                        decoration: InputDecoration(hintText: "Add new task"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          onPressed: () {
                            addTask();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 28),
                          ))
                    ],
                  ),
                ),
              );
            },
            // isScrollControlled: true,
          );
        },
        backgroundColor: Colors.redAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
