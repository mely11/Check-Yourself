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
        home: new TodoListScreen()
    );
  }
}
