import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo2/ui/todo_widget.dart';

class TodoListTab extends StatefulWidget {
  @override
  State<TodoListTab> createState() => _TodoListTabState();
}

class _TodoListTabState extends State<TodoListTab> {
  DateTime selectedDay = DateTime.now();

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TableCalendar(
            selectedDayPredicate: (day) {
              return isSameDay(day, selectedDay);
            },
            onDaySelected: (sDay, fDay) {
              setState(() {
                selectedDay = sDay;
                focusedDay = fDay; // update `_focusedDay` here as well
              });
            },
            calendarFormat: CalendarFormat.week,
            focusedDay: focusedDay,
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(Duration(days: 365)),
            calendarStyle: CalendarStyle(
              selectedTextStyle: TextStyle(
                color: Colors.white,
              ),
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              todayTextStyle: TextStyle(
                color: Colors.white,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(12),
              ),
              defaultTextStyle: TextStyle(
                color: Colors.black,
              ),
              defaultDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            weekendDays: [],
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (buildContext, index) {
                  return TodoWidget();
                },
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
