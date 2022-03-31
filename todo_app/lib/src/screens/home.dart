// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:todo_app/src/classes/todo.dart';
import 'package:todo_app/src/widgets/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = [
    Todo(
      id: 1,
      details: 'Walk the goldfish',
    ),
  ];

  final ScrollController _sc = ScrollController();
  // final TextEditingController _tc = TextEditingController();
  // final FocusNode _fn = FocusNode();
  int? tempIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Task Manager',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: appBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          "Add Task",
          style: TextStyle(letterSpacing: .5),
        ),
        icon: Icon(Icons.add_box_rounded),
      ),
    );
  }

  SafeArea appBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _sc,
                child: ActiveTasks(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // textField()
          ],
        ),
      ),
    );
  }

  // TextFormField textField() {
  //   return TextFormField(
  //     controller: _tc,
  //     focusNode: _fn,
  //     maxLines: 2,
  //     decoration: InputDecoration(
  //       focusedBorder: const OutlineInputBorder(),
  //       enabledBorder: const OutlineInputBorder(),
  //       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //       prefix: IconButton(
  //         icon: const Icon(Icons.clear, color: Colors.black),
  //         onPressed: () {
  //           tempIndex = null;
  //           _tc.text = '';
  //           _fn.unfocus();
  //         },
  //       ),
  //       suffix: IconButton(
  //         icon: const Icon(Icons.done, color: Colors.black),
  //         onPressed: () {
  //           setState(() {
  //             tempIndex == null
  //                 ? addTodo(_tc.text)
  //                 : todos[tempIndex ?? 0].details = _tc.text;
  //           });
  //           tempIndex = null;
  //           _tc.text = '';
  //           _fn.unfocus();
  //         },
  //       ),
  //     ),
  //   );
  // }

  addTodo(String details) {
    int index = 1;
    if (todos.isEmpty) {
      index = 1;
    } else {
      index = todos.last.id + 1;
    }

    if (mounted) {
      setState(() {
        todos.add(Todo(details: details, id: index));
      });
    }
  }

  removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }
}
