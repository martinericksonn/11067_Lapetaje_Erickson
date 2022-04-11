// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:todo_app/src/screens/form.dart';
import '../classes/controllers/todo_controller.dart';
import '../classes/model/todo_model.dart';
import '../widgets/active_todos.dart';
import '../widgets/finished_todos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoController _todoController = TodoController();
  bool cameraAccess = false;
  // @override
  // void initState() {
  //   _todoController.addListener(newToDoListener);
  //   super.initState();

  //   showAlert(context);
  // }

  int? tempIndex;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appTitle(context),
        backgroundColor: Theme.of(context).primaryColor,
        body: appBody(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: appFloatingButton(context),
      ),
    );
  }

  FloatingActionButton appFloatingButton(context) {
    return FloatingActionButton.extended(
      onPressed: () => {showAddTaskModal(context)},
      label: Text(
        "Add Task",
        style: TextStyle(
          letterSpacing: .5,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      icon: Icon(Icons.add_box_rounded),
    );
  }

  Center appBody(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: 52,
          child: ButtonsTabBar(
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
            radius: 50,
            contentPadding: EdgeInsets.fromLTRB(50, 12, 50, 12),
            unselectedBackgroundColor: Theme.of(context).colorScheme.primary,
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              const Tab(
                text: "Todo",
              ),
              const Tab(text: "Done"),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(children: [
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
          ]),
        )
      ]),
    );
  }

  AppBar appTitle(BuildContext context) {
    return AppBar(
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
    );
  }

  showAlert(BuildContext context) async {
    cameraAccess
        ? null
        : showPlatformDialog(
            context: context,
            builder: (context) => BasicDialogAlert(
              title: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  ),
                  Flexible(
                    child: RichText(
                        text: TextSpan(
                            text: 'Allow ',
                            style: TextStyle(color: Colors.black),
                            children: const <TextSpan>[
                          TextSpan(
                              text: "Todo",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: ' to take pictures and record videos?'),
                        ])),
                  ),
                ],
              ),
              actions: <Widget>[
                BasicDialogAction(
                    title: Text(
                      "DENY",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: null),
                BasicDialogAction(
                  title: Text(
                    "ALLOW",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
    cameraAccess = true;
  }

  showAddTaskModal(context) async {
    showAlert(context);
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
