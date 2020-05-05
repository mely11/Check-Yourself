import 'package:flutter/material.dart';
import 'package:calendar_strip/date-utils.dart';
import 'package:provider/provider.dart';
import 'package:calendar_strip/calendar_strip.dart';

import '../models/todo_model.dart';
import '../globals.dart' as globals;

class Calendar extends StatefulWidget{
  // This class creates a new calendar screen mutable state 
  // as a stateful widget
  @override
  createState()=> new CalendarScreenState();
}

class CalendarScreenState extends State<Calendar> {
  // This class sets up a calendar state; the calendar starts at 30 
  // days before today and ends at the last day of the next month
  DateTime startDate = DateTime.now().subtract(Duration(days: 30));
  DateTime endDate = DateUtils.getLastDayOfNextMonth();
  DateTime selectedDate = globals.setDate;
  List<DateTime> todayAndTaskDate = [
    DateTime.now(),
  ];

  getMarkedIndicatorWidget() {		
     // getMarkedIndicatorWidget method returns the MarkedIndicator widget 		
     return Row(mainAxisAlignment: MainAxisAlignment.center, children: [		
       Container(	
         width: 5,		
         height: 5,		
         decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.lightBlue[50]),		
       ),				
     ]);		
   }

  onSelect(DateTime data) {
    // onSelect method reassigns the global 'setDate' variable, 
    // updates the todo list screen, and returns the user to said screen
    globals.weekDay = data.weekday;
    globals.setDate = data;
    this.selectedDate = data;
    Provider.of<TodoModel> (context, listen: false).refreshAll();
    Navigator.of(context).pop();
    // if (Provider.of<TodoModel> (context, listen: false).todoItems != null)
    //   todayAndTaskDate.add(selectedDate);
  }

  _monthNameWidget(monthName) {
    // monthNameWidget method returns the container widget creating month names
    return Container(
      child: Text(monthName,
          style:
          TextStyle(fontSize: 21,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontStyle: FontStyle.italic)),
      padding: EdgeInsets.only(top: 5.2, bottom: 0),
    );
  }

  dateTileBuilder(date, selectedDate, rowIndex, dayName, isDateMarked,
      isDateOutOfRange) {
    // dateTileBuilder method builds the date tile and animates the container
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
    TextStyle normalStyle = TextStyle(
        fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
    TextStyle selectedStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black87);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked) {	
      // indicates and marks today
      _children.add(getMarkedIndicatorWidget());		
    }

    return AnimatedContainer(
      // returns the container that is animated by box decorations of each day 
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // build method builds the calendar
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar', 
          style: 
          TextStyle(fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 66, 177, 227),
      ),
      body: Container(
          child: CalendarStrip(
            startDate: startDate,
            endDate: endDate,
            selectedDate: selectedDate,
            onDateSelected: onSelect,
            dateTileBuilder: dateTileBuilder,
            iconColor: Colors.black54,
            monthNameWidget: _monthNameWidget,
            markedDates: todayAndTaskDate,
            containerDecoration: BoxDecoration(color: Color(0xffdfeaf1)),
          )
        ),
    );
  }
}

