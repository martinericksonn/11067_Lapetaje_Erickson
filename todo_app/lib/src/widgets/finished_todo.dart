// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../classes/todo.dart';

class FinishedTodos extends StatelessWidget {
  // FinishedTodos({
  //   Key? key,
  //   required this.finishedTodos,
  //   required this.activeTodos,
  //   required this.index,
  //   required this.markAsUndone,
  // }) : super(key: key);

  // List<Todo> activeTodos;
  // List<Todo> finishedTodos;
  // int index;

  // Function markAsUndone;
  @override
  Widget build(BuildContext context) {
    return activeTask();
  }

  FinishedTodos({
    Key? key,
    required this.primaryTodo,
    required this.secondaryTodo,
    required this.task,
  }) : super(key: key);

  List<Todo> primaryTodo;
  List<Todo> secondaryTodo;
  Function task;
  // ActiveList? todoListActive;

  // List<Todo> activeTodos;
  // List<Todo> finishedTodos;
  // int index;

  // Function markAsDone;

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
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        constraints: BoxConstraints(minHeight: 40),
                        // color: Colors.pink,
                        child: Text(
                          primaryTodo[index].details,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: IconButton(
                  icon: Icon(
                    Icons.check_circle_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () => task(primaryTodo, secondaryTodo, index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}