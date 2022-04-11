import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/todo_model.dart';

class TodoController with ChangeNotifier {
  final Box todoCache = Hive.box('todos');
  List<Todo> activeTask = [];
  List<Todo> finishedTask = [];

  TodoController() {
    List result = todoCache.get('todos', defaultValue: []);

    for (var entry in result) {
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

    todoCache.put('todos', dataToStore);
    notifyListeners();
  }
}
