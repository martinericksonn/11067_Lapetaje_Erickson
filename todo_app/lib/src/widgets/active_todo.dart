// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

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
  Widget emptyTodo() {
    return Center(
      child: Column(
        children: const [
          SizedBox(
            height: 30,
          ),
          Image(
            image: AssetImage('assets/images/emptyTodo.png'),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Todo is Empty")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.todoController.activeTask.isNotEmpty
        ? AnimatedBuilder(
            animation: widget.todoController,
            builder: (context, Widget? w) {
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(), //
                shrinkWrap: true,
                itemCount: widget.todoController.activeTask.length,
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
                                      widget.todoController.activeTask[index]
                                          .details,
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
                                          widget.todoController
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
                                    widget.editTask(widget
                                        .todoController.activeTask[index]);
                                  },
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.radio_button_off_rounded,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        widget.todoController.toggleDone(widget
                                            .todoController.activeTask[index]);
                                      });
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              );
            })
        : emptyTodo();
  }
}
