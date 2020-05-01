import 'package:flutter/material.dart';
import 'dart:collection';

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
  // This class sets up the TaskBuilder
  String taskName;
  // creates an unordered hash-table based Map that 
  // maps a Day enum object as key to a boolean value
  Map<Day, bool> willRecurOnDay = new HashMap<Day, bool>();

  TaskBuilder() {
    // constructor of the TaskBuilder that
    // initilizes all values of the enum Day 
    // objects to be false
    for (Day day in Day.values) {
      willRecurOnDay[day] = false;
    }
  }

  String getTaskName() {
    // gets the name of task instance
    return taskName;
  }

  setTaskName(String taskName) {
    // calls for setting the name of task
    this.taskName = taskName;
  }

  getWillRecurOnDay(Day day) {
    // returns the bool value of an input Day
    return willRecurOnDay[day];
  }

  setWillRecurOnDay(Day day, bool bool) {
    // sets the bool value of a input Day to be T/F
    willRecurOnDay[day] = bool;
  }

  bool isRecurring() {
    // loops over the value set of the the bool value of an 
    // input Day Map and returns if there is recurring happens
    bool tmp = false;
    for (bool val in willRecurOnDay.values) {
      tmp = tmp || val;
    }
    return tmp;
  }

  Task build() {
    // returns a new task initialized by a taskName
    return new Task(name: taskName);
  }
}