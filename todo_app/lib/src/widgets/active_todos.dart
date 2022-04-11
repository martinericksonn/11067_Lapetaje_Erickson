// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import '../classes/controllers/todo_controller.dart';

class ActiveList extends StatefulWidget {
  ActiveList({
    Key? key,
    required this.editTask,
    required this.todoController,
  }) : super(key: key);

  Function editTask;
  TodoController todoController;

  @override
  State<ActiveList> createState() => _ActiveListState();
}

class _ActiveListState extends State<ActiveList> {
  @override
  Widget build(BuildContext context) {
    return widget.todoController.activeTask.isNotEmpty
        ? taskList()
        : emptyTodo();
  }

  Widget emptyTodo() {
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            height: 350,
            child: Image(
              image: AssetImage('assets/images/emptyTodo.png'),
            ),
          ),
          Text("Todo is empty")
        ],
      ),
    );
  }

  Widget deleteBkg(int index) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Icon(
            Icons.delete,
            size: 28,
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 20),
            height: 20,
            child: Text(
              "Deleted",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget taskList() {
    return AnimatedBuilder(
        animation: widget.todoController,
        builder: (context, Widget? w) {
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(), //
            shrinkWrap: true,
            itemCount: widget.todoController.activeTask.length,
            itemBuilder: (context, index) => Dismissible(
              key: Key(widget.todoController.activeTask[index].details),
              onDismissed: (direction) {
                setState(() {
                  widget.todoController.deleteActiveTask(
                      widget.todoController.activeTask[index]);
                });
              },
              background: deleteBkg(index),
              direction: DismissDirection.startToEnd,
              child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        cardTitle(index, context),
                        cardButtons(index),
                      ],
                    ),
                  )),
            ),
          );
        });
  }

  Padding cardButtons(int index) {
    return Padding(
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
              widget.editTask(widget.todoController.activeTask[index]);
            },
          ),
          RoundCheckBox(
            borderColor: Colors.white,
            checkedColor: Colors.white,
            uncheckedWidget: Container(
              color: Colors.white,
              child: Icon(
                Icons.radio_button_off_rounded,
                color: Colors.black,
              ),
            ),
            checkedWidget: Container(
              color: Colors.white,
              child: Icon(
                Icons.check_circle_rounded,
                color: Colors.black,
              ),
            ),
            onTap: (selected) {
              setState(() {
                widget.todoController
                    .toggleDone(widget.todoController.activeTask[index]);
                // Timer(Duration(milliseconds: 1000), () {});
              });
            },
          ),
        ],
      ),
    );
  }

  Expanded cardTitle(int index, BuildContext context) {
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
                widget.todoController.activeTask[index].details,
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
                    widget.todoController.activeTask[index].parsedDate,
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
