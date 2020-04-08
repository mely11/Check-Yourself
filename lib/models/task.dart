import 'package:flutter/material.dart';

class Task {
  String name;
  bool done;
  bool recurs;

  Task({@required this.name, this.done = false});

  Task.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        done = json['done'],
        recurs = json['recurs'];

  Map<String, dynamic> toJson() =>
      {
        'name' : name,
        'done' : done,
        'recurs' : recurs,
      };

  void toggleDone() {
    done = !done;
  }
}

