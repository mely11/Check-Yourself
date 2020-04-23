import 'package:flutter/material.dart';

class Task {
  // This class constructs task objects along with their methods 
  String name;
  bool done;
  bool recurs;

  // task object constructor
  Task({@required this.name, this.done = false});  

  Task.fromJson(Map<String, dynamic> json) 
  // fromJson method constructs a new Task instance from a map structure
  // and allows json.decode method to decode fromJson and convert back
      : name = json['name'],
        done = json['done'],
        recurs = json['recurs'];

  Map<String, dynamic> toJson() => 
  // toJson method converts a Task instance into a map and allows 
  // json.encode method to encode a Task instance using toJson to
  // save todo data
      {
        'name' : name,
        'done' : done,
        'recurs' : recurs,
      };

  void toggleDone() { 
    // toggles a task (changes a task's 
    // state to be either done or undone)
    done = !done;
  }
}

