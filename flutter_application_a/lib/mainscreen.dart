import 'package:flutter/material.dart';
import 'package:flutter_application_a/add_task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {  
  List<String> todoList = [];
  
  void addTodo({required var todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Already exists"),
            content: const Text("this task is already exists"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("close"),
              )
            ],
          );
        }
      );
      return;
    }
    setState(() {
      todoList.insert(0, todoText);
    });
    writeLocalData();
    Navigator.pop(context);
  }

  void writeLocalData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todoList', todoList);
  }

  void loadData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    todoList = (prefs.getStringList('todoList') ?? []).toList();
    setState(() {
      todoList = (prefs.getStringList('todoList') ?? []).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

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
                      child: AddTask(
                        addTodo: addTodo,
                      ),
                    ),
                  );
                }
              );
            }, 
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: (){
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          todoList.removeAt(index);
                        });
                        writeLocalData();
                        Navigator.pop(context);
                      },
                      child: const Text("Task done!"),
                    ),
                  );
                },
              );
            },
            title: Text(todoList[index]),
          );
        }
      )
    );
  }
}