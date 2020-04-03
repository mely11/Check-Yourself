import 'package:flutter/material.dart';

class Task {
  String name;
  bool done;

  Task({@required this.name, this.done = false});

  Task.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        done = json['done'];

  Map<String, dynamic> toJson() =>

      {
        'name' : name,
        'done' : done,
      };

  void toggleDone() {
    done = !done;
  }
}

