import 'dart:collection';

import 'package:flutter/material.dart';

import 'day.dart';

class Task {
  // This class constructs task objects along with their methods
  String name;
  bool done;

  // task object constructor
  Task({@required this.name, this.done = false});

  Task.fromJson(Map<String, dynamic> json)
      // fromJson method constructs a new Task instance from a map structure
      // and allows json.decode method to decode fromJson and convert back
      : name = json['name'],
        done = json['done'];

  Map<String, dynamic> toJson() =>
      // toJson method converts a Task instance into a map and allows
      // json.encode method to encode a Task instance using toJson to
      // save todo data
      {
        'name': name,
        'done': done,
      };

  void toggleDone() {
    // toggles a task (changes a task's
    // state to be either done or undone)
    done = !done;
  }
}

class TaskBuilder {
  String taskName;
  Map<Day, bool> willRecurOnDay = new HashMap<Day, bool>();

  TaskBuilder() {
    for (Day day in Day.values) {
      willRecurOnDay[day] = false;
    }
  }

  String getTaskName() {
    return taskName;
  }

  setTaskName(String taskName) {
    this.taskName = taskName;
  }

  getWillRecurOnDay(Day day) {
    return willRecurOnDay[day];
  }

  setWillRecurOnDay(Day day, bool bool) {
    willRecurOnDay[day] = bool;
  }

  bool isRecurring() {
    bool tmp = false;
    for (bool val in willRecurOnDay.values) {
      tmp = tmp || val;
    }
    return tmp;
  }

  Task build() {
    return new Task(name: taskName);
  }
}