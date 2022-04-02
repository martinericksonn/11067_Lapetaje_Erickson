import 'package:flutter/material.dart';
import 'package:todo_app/src/classes/todo_model.dart';

class TodoController with ChangeNotifier {
  List<Todo> activeTask = [];
  List<Todo> finishedTask = [
    // Todo(
    //   id: 1,
    //   details: 'Feed the lions ',
    // ),
  ];

  void toggleDone(Todo task) {
    activeTask.remove(task);
    finishedTask.add(task);
    notifyListeners();
  }

  void toggleUndone(Todo task) {
    activeTask.add(task);
    finishedTask.remove(task);
    notifyListeners();
  }

  void addTask(String task) {
    activeTask.add(
      Todo(details: task.trim()),
    );
    notifyListeners();
  }

  void updateTask(Todo todo, String task) {
    todo.updateDetails(task);
    notifyListeners();
  }

  void deleteActiveTask(Todo task) {
    activeTask.remove(task);
    notifyListeners();
  }

  void deleteFinishedTask(Todo task) {
    finishedTask.remove(task);
    notifyListeners();
  }
}
