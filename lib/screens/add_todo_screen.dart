import 'dart:core';

import 'package:flutter/material.dart';
import 'package:Check_Yourself/models/todo_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo_model.dart';
import '../models/todo_model.dart';
import '../models/todo_model.dart';
import '../models/todo_model.dart';
import '../screens/calendar.dart';
import '../screens/options_screen.dart';
import '../widgets/todo_list.dart';
import '../models/task.dart';
import '../globals.dart' as globals;


class AddTodoScreen extends StatefulWidget{
  @override
  createState()=> new AddTodoScreenState();
}
class AddTodoScreenState extends State<AddTodoScreen> {
  String typedname;
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        appBar: new AppBar(title: new Text('Add a task')
        ),
        body: new Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              onSubmitted: (val) {
                Provider.of<TodoModel>(context, listen: false).addTodo(
                    Task(name: val));
                    typedname = val;
                    TodoModel().checkfrequency();
                Navigator.pop(context);
              },
              decoration: new InputDecoration(
                  hintText: "What do you want to accomplish?",
                  contentPadding: const EdgeInsets.all(15.0)
              ),
            ),
          CheckboxListTile(
            title: Text('Daily'),
            value: globals.dailyvalue,
            onChanged: (bool value){
              setState(() {
                globals.dailyvalue = value;
              });
            },
            activeColor: Colors.white,
            checkColor: Colors.green,
          ),
            CheckboxListTile(
              title: Text('Sunday'),
              value: globals.sundayvalue,
              onChanged: (bool value){
                setState(() {
                  globals.sundayvalue = value;
                });
              },
              activeColor: Colors.white,
              checkColor: Colors.green,
            ),
            CheckboxListTile(
              title: Text('Monday'),
              value: globals.mondayvalue,
              onChanged: (bool value){
                setState(() {
                  globals.mondayvalue = value;
                });
              },
              activeColor: Colors.white,
              checkColor: Colors.green,
            ),
            CheckboxListTile(
              title: Text('Tuesday'),
              value: globals.tuesdayvalue,
              onChanged: (bool value){
                setState(() {
                  globals.tuesdayvalue = value;
                });
              },
              activeColor: Colors.white,
              checkColor: Colors.green,
            ),
            CheckboxListTile(
              title: Text('Wednesday'),
              value: globals.wednesdayvalue,
              onChanged: (bool value){
                setState(() {
                  globals.wednesdayvalue = value;
                });
              },
              activeColor: Colors.white,
              checkColor: Colors.green,
            ),
            CheckboxListTile(
              title: Text('Thursday'),
              value: globals.thursdayvalue,
              onChanged: (bool value){
                setState(() {
                  globals.thursdayvalue = value;
                });
              },
              activeColor: Colors.white,
              checkColor: Colors.green,
            ),
            CheckboxListTile(
              title: Text('Friday'),
              value: globals.fridayvalue,
              onChanged: (bool value){
                setState(() {
                  globals.fridayvalue = value;
                });
              },
              activeColor: Colors.white,
              checkColor: Colors.green,
            ),
            CheckboxListTile(
              title: Text('Saturday'),
              value: globals.saturdayvalue,
              onChanged: (bool value){
                setState(() {
                  globals.saturdayvalue = value;
                });
              },
              activeColor: Colors.white,
              checkColor: Colors.green,
            ),
          ],
        )
    );
  }

  Widget prompt_frequency(BuildContext context) {
    return new CheckboxListTile(
      title: Text('Monday'),
        value: false,
        onChanged: null

    );
  }

  Widget add_todo(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('add a task')
        ),
        body: new TextField(
          autofocus: true,
          onSubmitted: (val) {
            Provider.of<TodoModel>(context, listen: false).addTodo(
                Task(name: val));
            typedname = val;
            Navigator.pop(context);
          },
          decoration: new InputDecoration(
              hintText: "What do you want to accomplish?",
              contentPadding: const EdgeInsets.all(15.0)
          ),
        )
    );
  }
}