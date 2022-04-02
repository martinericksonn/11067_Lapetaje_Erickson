// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:todo_app/src/classes/todo_model.dart';

// ignore: must_be_immutable
class TaskForm extends StatefulWidget {
  TaskForm({Key? key, this.currentTask, this.todo}) : super(key: key);

  Todo? todo;
  String? currentTask;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final TextEditingController _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? get currentTask => widget.currentTask;

  @override
  void initState() {
    if (currentTask != null) _textController.text = currentTask as String;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                formTitle(),
                formTextField(),
                formButtons(context),
              ],
            ),
          ),
        ));
  }

  Expanded formButtons(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Text(
                "Cancel",
                style: TextStyle(
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pop(Todo(details: _textController.text));
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                child: Text(
                  "Save Task",
                  style: TextStyle(
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding formTextField() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        controller: _textController,
        autofocus: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        decoration: InputDecoration(
          label: Text("Task Name"),

          // label:
        ),
      ),
    );
  }

  Padding formTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Text(
        widget.currentTask != null ? "Edit Task" : "New Task",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
      ),
    );
  }
}
