import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/todo_model.dart';

class TodoController with ChangeNotifier {
  final Box todoCache = Hive.box('todos');
  late String? currentUser;
  List<Todo> activeTask = [];
  List<Todo> finishedTask = [];

  TodoController(this.currentUser) {
    List result = todoCache.get(currentUser, defaultValue: []);
    print(currentUser);
    for (var entry in result) {
      print(entry);
      if (!entry['done']) {
        activeTask.add(Todo.fromJson(Map<String, dynamic>.from(entry)));
      } else {
        finishedTask.add(Todo.fromJson(Map<String, dynamic>.from(entry)));
      }
    }
    notifyListeners();
  }

  void toggleDone(Todo task) {
    task.toggleDone();
    activeTask.remove(task);
    finishedTask.add(task);
    saveDataToCache();
  }

  void toggleUndone(Todo task) {
    task.toggleDone();
    activeTask.add(task);
    finishedTask.remove(task);
    saveDataToCache();
  }

  void addTask(String task) {
    print("current Useeeeeeeeeeeeeeeeeeeeeeeer $currentUser");

    activeTask.add(
      Todo(details: task.trim()),
    );
    saveDataToCache();
  }

  void updateTask(Todo todo, String task) {
    todo.updateDetails(task);
    saveDataToCache();
  }

  void deleteActiveTask(Todo task) {
    activeTask.remove(task);
    saveDataToCache();
  }

  void deleteFinishedTask(Todo task) {
    finishedTask.remove(task);
    saveDataToCache();
  }

  saveDataToCache() {
    List<Map<String, dynamic>> dataToStore = [];
    for (Todo todo in activeTask) {
      dataToStore.add(todo.toJson());
    }
    for (Todo todo in finishedTask) {
      dataToStore.add(todo.toJson());
    }

    todoCache.put(currentUser, dataToStore);
    notifyListeners();
  }
}
