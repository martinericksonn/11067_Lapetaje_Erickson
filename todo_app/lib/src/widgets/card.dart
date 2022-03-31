// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../classes/todo.dart';

class ActiveTasks extends StatefulWidget {
  ActiveTasks({Key? key}) : super(key: key);

  @override
  State<ActiveTasks> createState() => _ActiveTasksState();
}

class _ActiveTasksState extends State<ActiveTasks> {
  List<Todo> todos = [
    Todo(
      id: 1,
      details: 'Walk the goldfish ',
    ),
    Todo(
      id: 2,
      details:
          'Extra looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong task',
    ),
    Todo(
      id: 3,
      details:
          'Modrateloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong task',
    ),
  ];

  int? tempIndex;
  bool isClicked = false;
  IconData radioIcon = Icons.radio_button_off_rounded;
  final TextEditingController _tc = TextEditingController();
  final FocusNode _fn = FocusNode();

  AnimatedList activeTask() {
    return AnimatedList(
      initialItemCount: todos.length,
      itemBuilder: (context, index, animtion) => Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.black),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            constraints: BoxConstraints(minHeight: 40),
                            // color: Colors.pink,
                            child: Text(
                              todos[index].details,
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
                                      .format(todos[index].created),
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
                    child: Container(
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
                              radioIcon,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              if (isClicked)
                                isClicked = false;
                              else
                                isClicked = true;

                              // tempIndex = index;
                              // _fn.requestFocus();
                              // _tc.text = todos[index].details;
                              setState(() {
                                if (isClicked) {
                                  print("true");
                                  radioIcon = Icons.check_circle_rounded;
                                } else {
                                  print("false");
                                  radioIcon = Icons.radio_button_off_rounded;
                                }
                                todos.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  ListTile newMethod(int index, BuildContext context) {
    return ListTile(
        title: Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(minHeight: 40),
          // color: Colors.pink,
          child: Text(
            todos[index].details,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Container(
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
                DateFormat.yMMMEd().format(todos[index].created),
                style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
        ),
        trailing: Container(
          color: Colors.red,
          child: Column(
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
              Expanded(
                child: IconButton(
                  icon: const Icon(
                    Icons.radio_button_off_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    tempIndex = index;
                    _fn.requestFocus();
                    _tc.text = todos[index].details;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return activeTask();
  }
}
