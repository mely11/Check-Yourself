import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/recur_list.dart';
import '../models/recur_list_model.dart';

class EditRecurrenceScreen extends StatefulWidget{
  // This class creates a EditRecurScreenStat mutable state
  @override
  State<StatefulWidget> createState() => EditRecurScreenState();
}

class EditRecurScreenState extends State<EditRecurrenceScreen>{
  // This class controls the edit-recur screen state
  Widget _buildRecurTaskList(BuildContext context){
    // This builds recurList consisting of recurItems
    return Consumer<RecurListModel>(
      builder: (context, recurs, child) => RecurList(recurItems: recurs.recurItems)
    );
  }

  @override
  Widget build(BuildContext context) {
    // This creates the buildOptionsList
    return new Scaffold(
        backgroundColor: Color(0xffdfeaf1),
        appBar: AppBar(
          title: Text ('Recurring Tasks'),
        ),
        body: _buildRecurTaskList(context),
    );
  }
}