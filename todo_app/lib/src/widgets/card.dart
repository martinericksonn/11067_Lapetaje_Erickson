// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/src/widgets/active_todo.dart';

import '../classes/todo.dart';
import 'finished_todo.dart';

// ignore: must_be_immutable
class Tasks extends StatelessWidget {
  // Tasks(
  //     {Key? key,
  //     required this.primaryTodo,
  //     required this.secondaryTodo,
  //     required this.task,
  //     required this.todoList})
  //     : super(key: key);

  Tasks(
      {Key? key,
      required this.primaryTodo,
      this.todoListActive,
      this.todoListFin})
      : super(key: key);
  List<Todo> primaryTodo;
  // List<Todo> secondaryTodo;
  // Function task;
  ActiveList? todoListActive;
  FinishedTodos? todoListFin;

  int? tempIndex;
  bool isClicked = false;
  IconData radioIcon = Icons.radio_button_off_rounded;
  final TextEditingController tc = TextEditingController();
  final FocusNode fn = FocusNode();

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
        child: todoListActive ?? todoListFin,
      ),
    );
  }

  // ListView finishedTask() {
  //   return ListView.builder(
  //     physics: const NeverScrollableScrollPhysics(), //
  //     shrinkWrap: true,
  //     itemCount: finishedTodos.length,
  //     itemBuilder: (context, index) => Card(
  //       elevation: 0,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20),
  //         side: BorderSide(color: Colors.black),
  //       ),
  //       child:
  //     ),
  //   );
  // }

  // ListTile newMethod(int index, BuildContext context) {
  //   return ListTile(
  //       title: Container(
  //         alignment: Alignment.centerLeft,
  //         constraints: BoxConstraints(minHeight: 40),
  //         // color: Colors.pink,
  //         child: Text(
  //           activeTodos[index].details,
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //       subtitle: Container(
  //         alignment: Alignment.centerLeft,
  //         // color: Colors.red,
  //         height: 40,
  //         child: Row(
  //           children: [
  //             Icon(Icons.calendar_today),
  //             SizedBox(
  //               width: 10,
  //             ),
  //             Text(
  //               DateFormat.yMMMEd().format(activeTodos[index].created),
  //               style: TextStyle(
  //                   fontSize: 12,
  //                   color: Theme.of(context).colorScheme.secondary),
  //             ),
  //           ],
  //         ),
  //       ),
  //       trailing: Container(
  //         color: Colors.red,
  //         child: Column(
  //           children: [
  //             IconButton(
  //               icon: const Icon(
  //                 Icons.edit,
  //                 color: Colors.black,
  //               ),
  //               onPressed: () {
  //                 // removeTodo(index);
  //               },
  //             ),
  //             Expanded(
  //               child: IconButton(
  //                 icon: const Icon(
  //                   Icons.radio_button_off_rounded,
  //                   color: Colors.black,
  //                 ),
  //                 onPressed: () {
  //                   tempIndex = index;
  //                   _fn.requestFocus();
  //                   _tc.text = activeTodos[index].details;
  //                   setState(() {});
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return activeTask();
  }
}
