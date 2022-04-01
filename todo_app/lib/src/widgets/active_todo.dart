// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

import '../classes/controllers/todo_controller.dart';
import '../classes/todo.dart';

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

    // required this.secondaryTodo,
    // required this.task,
    required this.editTask,
    required this.todoController,
  }) : super(key: key);

  // List<Todo> secondaryTodo;
  // Function task;
  Function editTask;
  TodoController todoController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: todoController,
        builder: (context, Widget? w) {
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(), //
            shrinkWrap: true,
            itemCount: todoController.activeTask.length,
            itemBuilder: (context, index) => Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.black),
                ),
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
                                  todoController.activeTask[index].details,
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
                                      todoController
                                          .activeTask[index].parsedDate,
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
                                print(todoController.activeTask.length);
                                editTask(todoController.activeTask[index]);
                              },
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.radio_button_off_rounded,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  todoController.toggleDone(
                                      todoController.activeTask[index]);

                                  print(todoController.activeTask);
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
