// import 'dart:core';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/widgets.dart';
// // import 'package:todo_app/assets/images';
// import 'todo_list_screen.dart';

// class LoadingScreen extends StatefulWidget {
//   @override
//   LoadingScreenState createState() => LoadingScreenState();
// }

 
// class LoadingScreenState extends State<LoadingScreen> {
//   @override
//   Widget build(BuildContext context) {
//   }	
// }


// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.black,
//     body: new InkWell(
//       child: new Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           /// Paint the area where the inner widgets are loaded with the
//           /// background to keep consistency with the screen background
//           new Container(
//             decoration: BoxDecoration(color: Colors.black),
//           ),
//           /// Render the background image
//           new Container(
//             child: Image.asset('background.png', fit: BoxFit.cover),
//           ),
//           /// Render the Title widget, loader and messages below each other
//           new Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               new Expanded(
//                 flex: 3,
//                 child: new Container(
//                     child: new Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         new Padding(
//                           padding: const EdgeInsets.only(top: 30.0),
//                         ),
//                         // ‘Application Title’,
//                       ],
//                     )),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     /// Loader Animation Widget
//                     CircularProgressIndicator(
//                       valueColor: new AlwaysStoppedAnimation<Color>(
//                           Colors.green),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20.0),
//                     ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }


// @override
// void initState() {

//   /// We require the initializers to run after the loading screen is rendered
//   SchedulerBinding.instance.addPostFrameCallback((_) {
//     runInitTasks();
//   });

// }
 
// // This method calls the initializers and once they complete redirects to
// // the widget provided in navigateAfterInit
// @protected
// Future runInitTasks() async {
// //  Run each initializer method sequentially
//   var widget;
//     Future.forEach(widget.initializers, (init) => init()).whenComplete(() {
//     BuildContext context;
//         Navigator.of(context).pushReplacement(new MaterialPageRoute(
//       builder: (BuildContext context) => TodoListScreen()));
//   });
// }