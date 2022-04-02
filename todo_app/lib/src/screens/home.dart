// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:todo_app/src/classes/todo.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:todo_app/src/screens/task_form.dart';
import '../classes/controllers/todo_controller.dart';
import '../widgets/active_todos.dart';
import '../widgets/finished_todos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoController _todoController = TodoController();

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
                  fontSize: 15,
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
                  const Tab(
                    text: "Todo",
                  ),
                  const Tab(text: "Done"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ActiveList(
                        todoController: _todoController,
                        editTask: showEditTaskModal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: FinishedTodos(
                        todoController: _todoController,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => {showAddTaskModal()},
          label: Text(
            "Add Task",
            style: TextStyle(
              letterSpacing: .5,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          icon: Icon(Icons.add_box_rounded),
        ),
      ),
    );
  }

  showAddTaskModal() async {
    Todo? task = await showModalBottomSheet(
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
          child: TaskForm(),
        );
      },
    );
    if (task != null) {
      _todoController.addTask(task.details);
    }
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
          ),
        );
      },
    );
    if (task != null) {
      _todoController.updateTask(todo, task.details);
    }
  }
}
