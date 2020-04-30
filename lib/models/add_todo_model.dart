import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'shared_preferences_storage.dart';

import '../globals.dart' as globals;
import 'day.dart';
import 'task.dart';
import 'todo_model.dart';

class AddTodoModel {
  // This class creates an AddTodoModel 
  TaskBuilder taskBuilder = new TaskBuilder();

  getTaskName() {
    // get the TaskName of a task
    return taskBuilder.getTaskName();
  }

  setTaskName(String taskName) {
    // sets the name of a task 
    taskBuilder.setTaskName(taskName);
  }

  getWillRecurOnDay(Day day) {
    // gets the bool value of an input Day
    return taskBuilder.getWillRecurOnDay(day);
  }

  setWillRecurOnDay(Day day, bool bool) {
    // sets the bool value of a input Day to 
    // be an input bool value (T/F)
    taskBuilder.setWillRecurOnDay(day, bool);
  }

  createTask(BuildContext context) async {
    // creates a newTask, adds it to TodayList, and finally
    // further processes it to be a recur task if it'is recurring
    Task newTask = taskBuilder.build();
    _addTaskToTodayList(context, newTask);
    _processRecurringTaskIfNeeded(context, newTask);
  }

  _addTaskToTodayList(BuildContext context, Task task) {
    // adds a task to the list using addTodo in TodoModel
    Provider.of<TodoModel>(context, listen: false).addTodo(task);
  }

  _processRecurringTaskIfNeeded(BuildContext context, Task task) async {
    // process a potential RecurringTask by adding the input task
    // to recurring task lists for specified days
    if (taskBuilder.isRecurring()) {
      // TODO fix this
      await _addTaskToRecurringTaskListsForSpecifiedDays(context, task);
      SharedPreferencesStorage.getInstance()
          .addTaskToAllRecurringTasksList(context, task);
    }
  }

  _addTaskToRecurringTaskListsForSpecifiedDays(
    // adds the task to  Applies [f] to each key/value pair of the map.
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
