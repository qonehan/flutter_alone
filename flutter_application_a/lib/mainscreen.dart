import 'package:flutter/material.dart';
import 'package:flutter_application_a/calendarscreen.dart';
import 'package:flutter_application_a/todoscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Text("Drawer"),
      ),
      body: IndexedStack(
        index: _index,
        children: [
          Todoscreen(),
          Calendarscreen()
        ],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'todoListScreen'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'calendarScreen')
        ],
      ),
    );
  }
}
