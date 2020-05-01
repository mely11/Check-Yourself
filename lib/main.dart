import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'globals.dart' as globals;
import 'models/recur_list_model.dart';
import 'screens/todo_list_screen.dart';
import 'models/todo_model.dart';


void main() {
  // This is the main function that sets the current date and calls upon MyApp
  globals.setDate = DateTime.now();
  globals.weekDay = DateTime.now().weekday;
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
  // This class creates and builds the app/TodoListScreen 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Check Yourself',
        home: new TodoListScreen(),
        color: Color.fromARGB(255, 66, 177, 227),
        theme: ThemeData(
          buttonColor: Color(0xffdfeaf1)),
        //     textTheme: TextTheme(
        //     body2: TextStyle(color: Colors.white60, fontSize: 21.0),
        //     display1: TextStyle(color: Colors.black87, fontSize: 37.0),
        //     caption: TextStyle(
        //     color: Colors.white,
        //     fontSize: 14.0,
        //     fontWeight: FontWeight.bold),
        //     subhead: TextStyle(color: Colors.black45, fontSize: 12.0),
    );
  }
}
