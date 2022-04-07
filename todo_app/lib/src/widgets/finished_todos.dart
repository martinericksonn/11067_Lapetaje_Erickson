// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../classes/controllers/todo_controller.dart';

// ignore: must_be_immutable
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
              return taskList();
            })
        : emptyDone();
  }

  Widget emptyDone() {
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            height: 320,
            child: Image(
              image: AssetImage('assets/images/emptyDone.png'),
            ),
          ),
          Text("No completed task")
        ],
      ),
    );
  }

  Widget deleteBkg() {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 20,
            child: Text(
              "Deleted",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Icon(
            Icons.delete,
            size: 28,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }

  ListView taskList() {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(), //
      shrinkWrap: true,
      itemCount: widget.todoController.finishedTask.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key(widget.todoController.finishedTask[index].details),
        onDismissed: (direction) {
          setState(() {
            widget.todoController
                .deleteFinishedTask(widget.todoController.finishedTask[index]);
          });
        },
        background: deleteBkg(),
        direction: DismissDirection.endToStart,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.black),
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                cardTitle(index),
                cardButton(index),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding cardButton(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
          icon: Icon(
            Icons.check_circle_rounded,
            color: Colors.black,
          ),
          onPressed: () => setState(() {
                widget.todoController
                    .toggleUndone(widget.todoController.finishedTask[index]);
              })),
    );
  }

  Expanded cardTitle(int index) {
    return Expanded(
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
    );
  }
}
