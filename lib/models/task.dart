import 'package:flutter/material.dart';

class Task {
  String name;
  bool done;

  Task({@required this.name, this.done = false});

  Task.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        done = json['done'];

  Map<String, dynamic> toJson() =>
<<<<<<< HEAD
    {
      'name': name,
      'done': done,
    };
=======
      {
        'name' : name,
        'done' : done,
      };
>>>>>>> 8399bf51e05bd22a8b3bb1577b608f6ad2681837

  void toggleDone() {
    done = !done;
  }
}

