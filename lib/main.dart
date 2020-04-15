import 'package:flutter/material.dart';
import 'package:todo_app/models/date_operations.dart';
import 'package:todo_app/models/recur_list_model.dart';
import 'package:todo_app/screens/todo_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_model.dart';
// import 'package:todo_app/screens/loading_screen.dart';
import 'globals.dart' as globals;

void main() {
  // main function that sets current date and calls upon MyApp
  globals.setDate = DateOperations().getCurrentDate();
//  globals.setDate = 'allRecur';
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider (create: (context) => TodoModel()),
        ChangeNotifierProvider (create: (context) => RecurListModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // Creates and builds the app/TodoListScreen 
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