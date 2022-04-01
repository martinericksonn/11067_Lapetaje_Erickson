// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../classes/controllers/todo_controller.dart';

class FinishedTodos extends StatefulWidget {
  @override
  State<FinishedTodos> createState() => _FinishedTodosState();

  FinishedTodos({
    Key? key,
    required this.todoController,
  }) : super(key: key);
  TodoController todoController;
}

class _FinishedTodosState extends State<FinishedTodos> {
  @override
  Widget build(BuildContext context) {
    return widget.todoController.finishedTask.isNotEmpty
        ? AnimatedBuilder(
            animation: widget.todoController,
            builder: (context, Widget? w) {
              return activeTask();
            })
        : emptyDone();
  }

  Widget emptyDone() {
    return Center(
      child: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          Image(
            image: AssetImage('assets/images/emptyDone.png'),
          ),
          SizedBox(
            height: 10,
          ),
          Text("No currently done task")
        ],
      ),
    );
  }

  ListView activeTask() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(), //
      shrinkWrap: true,
      itemCount: widget.todoController.finishedTask.length,
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
                          widget.todoController.finishedTask[index].details,
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
                    onPressed: () => setState(() {
                          widget.todoController.toggleUndone(
                              widget.todoController.finishedTask[index]);
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
