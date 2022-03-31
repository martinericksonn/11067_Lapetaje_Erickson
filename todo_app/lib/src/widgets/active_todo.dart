// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:todo_app/src/classes/todo.dart';

class ActiveList extends StatelessWidget {
  // ActiveList({
  //   Key? key,
  //   required this.finishedTodos,
  //   required this.activeTodos,
  //   required this.index,
  //   required this.markAsDone,
  // }) : super(key: key);

  ActiveList({
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
                        Container(
                          alignment: Alignment.centerLeft,
                          // color: Colors.red,
                          height: 40,
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                DateFormat.yMMMEd()
                                    .format(primaryTodo[index].created),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // removeTodo(index);
                        },
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.radio_button_off_rounded,
                            color: Colors.black,
                          ),
                          onPressed: () =>
                              task(primaryTodo, secondaryTodo, index)),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return activeTask();
  }
}
