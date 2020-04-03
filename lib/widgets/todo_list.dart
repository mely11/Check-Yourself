import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todoItem.dart';
import 'package:todo_app/models/task.dart';

class TodoList extends StatelessWidget {
  final List<Task> todoItems;

  TodoList({@required this.todoItems});

  @override
  Widget build(BuildContext context){
      return ListView(
        children: getChildrenTasks(),
      );
  }

  List<Widget> getChildrenTasks() {
    return todoItems.map((todo) => TodoItem(task: todo)).toList();
  }
}