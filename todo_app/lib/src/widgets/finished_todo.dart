// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../classes/controllers/todo_controller.dart';

class FinishedTodos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: todoController,
        builder: (context, Widget? w) {
          return activeTask();
        });
  }

  FinishedTodos({
    Key? key,
    // required this.primaryTodo,
    // required this.secondaryTodo,
    required this.todoController,
  }) : super(key: key);
  TodoController todoController;

  ListView activeTask() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(), //
      shrinkWrap: true,
      itemCount: todoController.finishedTask.length,
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
                          todoController.finishedTask[index].details,
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
                  onPressed: () => todoController
                      .toggleUndone(todoController.finishedTask[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
