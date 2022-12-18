import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//カレンダーの作成

var now = DateTime.now();
var firstDay = DateTime(now.year,now.month -3, now.day);
var lastDay = DateTime(now.year,now.month +3, now.day);

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  CalendarFormat format = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          focusedDay: now,
          firstDay: firstDay,
          lastDay: lastDay,
          calendarFormat: format,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: const HeaderStyle(formatButtonVisible: false,titleCentered: true),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
                color: Colors.cyan,
                shape: BoxShape.circle
            ),
          ),
        ),
      ],
    );
  }
}