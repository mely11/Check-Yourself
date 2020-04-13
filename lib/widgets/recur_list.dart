import 'package:flutter/material.dart';
import 'package:todo_app/widgets/recur_Item.dart';
import 'package:todo_app/models/task.dart';

class RecurList extends StatelessWidget {
  final List<Task> recurItems;

  RecurList({@required this.recurItems});

  @override
  Widget build(BuildContext context){
    return ListView(
      children: getChildrenTasks(),
    );
  }

  List<Widget> getChildrenTasks() {
    return recurItems.map((recur) => RecurItem(task: recur)).toList();
  }
}