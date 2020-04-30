import 'package:flutter/material.dart';

import 'recur_Item.dart';
import '../models/task.dart';

class RecurList extends StatelessWidget {
  // This class builds a recurrence list
  final List<Task> recurItems;

  // This is the constructor that builds a recur list
  // that contains a list of recurItems
  RecurList({@required this.recurItems});

  @override
  Widget build(BuildContext context){
    // This returns a listView of childrenTasks
    return ListView(
      children: getChildrenTasks(),
    );
  }

  List<Widget> getChildrenTasks() {
    // This returns recurItems that is mapped to be a list of iterable recurItem 
    return recurItems.map((recur) => RecurItem(task: recur)).toList();
  }
}