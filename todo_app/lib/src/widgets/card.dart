// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/src/widgets/active_todo.dart';

import '../classes/todo.dart';
import 'finished_todo.dart';

// ignore: must_be_immutable
class Tasks extends StatelessWidget {
  Tasks(
      {Key? key,
      required this.primaryTodo,
      this.todoListActive,
      this.todoListFin})
      : super(key: key);
  List<Todo> primaryTodo;
  // List<Todo> secondaryTodo;
  // Function task;
  ActiveList? todoListActive;
  FinishedTodos? todoListFin;

  int? tempIndex;
  bool isClicked = false;
  IconData radioIcon = Icons.radio_button_off_rounded;
  final TextEditingController tc = TextEditingController();
  final FocusNode fn = FocusNode();

  ListView activeTask() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(), //
      shrinkWrap: true,
      itemCount: primaryTodo.length,
      itemBuilder: (context, index) => Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.black),
        ),
        // child: todoList(
        //   activeTodos: primaryTodo,
        //   finishedTodos: secondaryTodo,
        //   markAsDone: task,
        //   index: index,
        // ),
        child: todoListActive ?? todoListFin,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return activeTask();
  }
}
