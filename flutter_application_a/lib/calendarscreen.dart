import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendarscreen extends StatefulWidget {
  const Calendarscreen({super.key});

  @override
  State<Calendarscreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<Calendarscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text("Calendar app"),
        centerTitle: true,
      ),
      body: Container(
        child: Text("Calendar screen"),
      ),
    );
  }
}
