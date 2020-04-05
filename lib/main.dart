import 'package:flutter/material.dart';
import 'package:todo_app/models/date_operations.dart';
import 'package:todo_app/screens/todo_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_model.dart';
import 'globals.dart' as globals;

void main() {
  globals.setDate = DateOperations().getCurrentDate();
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Check Yourself',
        home: new TodoListScreen()
    );
  }
}




// plz ignore this part
// TODO 
// theme: ThemeData(
// primarySwatch: Colors.lightBlue,
// textTheme: TextTheme(
// body2: TextStyle(color: Colors.white60, fontSize: 21.0),
// display1: TextStyle(color: Colors.black87, fontSize: 37.0),
// caption: TextStyle(
//   color: Colors.white,
//   fontSize: 14.0,
//   fontWeight: FontWeight.bold),
//   subhead: TextStyle(color: Colors.black45, fontSize: 12.0),
// )),