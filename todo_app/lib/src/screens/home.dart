// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:todo_app/src/classes/todo.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:todo_app/src/screens/task_form.dart';
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

  void addTask(List<Todo> todoList, String task) {
    todoList.add(
      Todo(details: task.trim()),
    );
  }

  void editTask(Todo todo, String task) {
    todo.updateDetails(task);
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
                  color: Theme.of(context).colorScheme.primary,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                radius: 50,
                contentPadding: EdgeInsets.fromLTRB(50, 12, 50, 12),

                unselectedBackgroundColor:
                    Theme.of(context).colorScheme.primary,

                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  const Tab(text: "Todo"),
                  const Tab(text: "Done"),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TabBarView(
                    children: [
                      ActiveList(
                        primaryTodo: activeTodos,
                        secondaryTodo: finishedTodos,
                        task: markAsDone,
                        editTask: showEditTaskModal,
                      ),
                      FinishedTodos(
                          primaryTodo: finishedTodos,
                          secondaryTodo: activeTodos,
                          task: markAsUndone),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => {},
          label: Text(
            "Add Task",
            style: TextStyle(letterSpacing: .5, fontWeight: FontWeight.bold),
          ),
          icon: Icon(Icons.add_box_rounded),
        ),
      ),
    );
  }

  showAddTaskModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (_) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: TaskForm(
              // executeFunction: addTask,
              // todos: activeTodos,
              ),
        );
      },
    );
  }

  showEditTaskModal(Todo todo) async {
    Todo? task = await showModalBottomSheet<Todo>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (_) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: TaskForm(
            currentTask: todo.details,
            // executeFunction: addTask,
            // todos: activeTodos,
          ),
        );
      },
    );
    if (task != null) {
      editTask(todo, task.details);
    }
  }
}
