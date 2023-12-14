import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeCalendarPage extends StatefulWidget {
  const HomeCalendarPage({super.key});

  @override
  _HomeCalendarPageState createState() => _HomeCalendarPageState();
}

class _HomeCalendarPageState extends State<HomeCalendarPage> {
  String date = "Default";
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(date),
        TableCalendar(
          rowHeight: 50,
          headerStyle: const HeaderStyle(
              formatButtonVisible: false, titleCentered: true),
          selectedDayPredicate: (day) => isSameDay(day, today),
          focusedDay: today,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 12, 18),
          onDaySelected: _onDaySee,
        )
      ],
    );
  }

  void _onDaySee(DateTime selectedDay, DateTime focusDay) {
    setState(() {
      date = '${selectedDay.day}/${selectedDay.month}/${selectedDay.year}';
      today = selectedDay;
    });
  }
}
