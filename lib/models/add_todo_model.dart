import 'dart:collection';

import 'package:Check_Yourself/models/task.dart';
import 'package:Check_Yourself/models/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../globals.dart' as globals;
import 'day.dart';
import 'shared_preferences_storage.dart';

class AddTodoModel {
  TaskBuilder taskBuilder = new TaskBuilder();

  getTaskName() {
    return taskBuilder.getTaskName();
  }

  setTaskName(String taskName) {
    taskBuilder.setTaskName(taskName);
  }

  getWillRecurOnDay(Day day) {
    return taskBuilder.getWillRecurOnDay(day);
  }

  setWillRecurOnDay(Day day, bool bool) {
    taskBuilder.setWillRecurOnDay(day, bool);
  }

  createTask(BuildContext context) async {
    Task newTask = taskBuilder.build();
    _addTaskToTodayList(context, newTask);
    _processRecurringTaskIfNeeded(context, newTask);
  }

  _addTaskToTodayList(BuildContext context, Task task) {
    Provider.of<TodoModel>(context, listen: false).addTodo(task);
  }

  _processRecurringTaskIfNeeded(BuildContext context, Task task) async {
    if (taskBuilder.isRecurring()) {
      // TODO fix this
      await _addTaskToRecurringTaskListsForSpecifiedDays(context, task);
      SharedPreferencesStorage.getInstance()
          .addTaskToAllRecurringTasksList(context, task);
    }
  }

  _addTaskToRecurringTaskListsForSpecifiedDays(
      BuildContext context, Task task) async {
    globals.recurModelInit = true;
    taskBuilder.willRecurOnDay.forEach((day, val) {
      // TODO fix this
      if (val) {
        SharedPreferencesStorage.getInstance().addTaskToRecurringDay(context, task, day);
      }
    });
  }
}
