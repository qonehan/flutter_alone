import 'package:flutter/material.dart';
import 'package:flutter_application_a/add_task.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Text("Drawer"),
      ),
      appBar: AppBar(
        title: const Text("TODO App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context, 
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: 250,
                      child: AddTask(),
                    ),
                  );
                }
              );
            }, 
            icon: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}