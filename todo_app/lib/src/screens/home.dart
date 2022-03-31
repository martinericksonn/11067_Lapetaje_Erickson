// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:todo_app/src/classes/todo.dart';
import 'package:todo_app/src/widgets/card.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

import '../widgets/active_todo.dart';
import '../widgets/finished_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> activeTodos = [
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

  List<Todo> finishedTodos = [
    Todo(
      id: 1,
      details: 'Walk the goldfish ',
    ),
  ];
  void markAsDone(List<Todo> activeTodos, List<Todo> finishedTodos, int index) {
    if (mounted) {
      setState(() {
        finishedTodos.add(activeTodos[index]);
        activeTodos.removeAt(index);
      });
    }
  }

  void markAsUndone(
      List<Todo> finishedTodos, List<Todo> activeTodos, int index) {
    if (mounted) {
      setState(() {
        activeTodos.add(finishedTodos[index]);
        finishedTodos.removeAt(index);
      });
    }
  }

  final ScrollController _sc = ScrollController();
  // final TextEditingController _tc = TextEditingController();
  // final FocusNode _fn = FocusNode();
  int? tempIndex;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: Center(
          child: Column(
            children: [
              ButtonsTabBar(
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontSize: 18,
                  color: Theme.of(context).colorScheme.primary,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                // height: 50,
                radius: 50,
                contentPadding: EdgeInsets.fromLTRB(50, 12, 50, 12),
                // buttonMargin: EdgeInsets.all(1),
                unselectedBackgroundColor:
                    Theme.of(context).colorScheme.primary,
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  Tab(
                    text: "Todo",
                  ),
                  Tab(
                    text: "Done",
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TabBarView(children: [
                    ActiveList(
                        primaryTodo: activeTodos,
                        secondaryTodo: finishedTodos,
                        task: markAsDone),
                    FinishedTodos(
                        primaryTodo: finishedTodos,
                        secondaryTodo: activeTodos,
                        task: markAsUndone),
                    // Tasks(todoListActive: ActiveList(activeTodos: activeTodos,finishedTodos: finishedTodos,index: index),),
                  ]),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            "Add Task",
            style: TextStyle(letterSpacing: .5, fontWeight: FontWeight.bold),
          ),
          icon: Icon(Icons.add_box_rounded),
        ),
      ),
    );
  }

  // SafeArea appBody() {
  //   return SafeArea(
  //     child: Padding(
  //       padding: const EdgeInsets.all(12.0),
  //       child: Column(
  //         children: [
  //           Expanded(
  //             child: SingleChildScrollView(
  //               controller: _sc,
  //               child: Tasks(),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           // textField()
  //         ],
  //       ),
  //     ),
  //   );
  // }

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

  // addTodo(String details) {
  //   int index = 1;
  //   if (todos.isEmpty) {
  //     index = 1;
  //   } else {
  //     index = todos.last.id + 1;
  //   }

  //   if (mounted) {
  //     setState(() {
  //       todos.add(Todo(details: details, id: index));
  //     });
  //   }
  // }

  // removeTodo(int index) {
  //   setState(() {
  //     todos.removeAt(index);
  //   });
  // }
}
