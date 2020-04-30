import 'package:flutter/material.dart';

import 'todoItem.dart';
import '../models/task.dart';

class TodoList extends StatelessWidget {
  // This class constructs a TodoList
  final List<Task> todoItems;

  // This is a constructor of TodoList
  TodoList({@required this.todoItems});

  @override
  Widget build(BuildContext context){
    // Builds a list view of tasks containing children tasks
      return ListView(
        children: getChildrenTasks(),
      );
  }

  List<Widget> getChildrenTasks() {
    // Obtains each task in the todoItems list and uses 
    // map function to map each Task object to a list of 
    // iterable Task object
    return todoItems.map((todo) => TodoItem(task: todo)).toList();
  }
}