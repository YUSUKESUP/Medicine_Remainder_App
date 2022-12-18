import 'package:flutter/material.dart';
import '../todo_tile.dart';
import 'appbar_custom.dart';
import 'calender_screen.dart';
import 'dialog_box.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final _controller = TextEditingController();
  final _timeController = TextEditingController();

  List toDoList = [
    ['assets/12361.png','レビデシベル','AM: 8:00'+'  '+'PM18:00'],
    ['assets/12361.png','レビデシベル','AM: 8:00'+'  '+'PM18:00'],
    ['assets/12361.png','レビデシベル','AM: 8:00'+'  '+'PM18:00'],
  ];

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text,_timeController.text]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context){
          return DialogBox(
            controller: _controller,
            timeController: _timeController,
            onSave:saveNewTask,
          );
        }
    );
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipPath(
          clipper: AppbarCustom(),
          child: Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            color: Colors.cyan,
            child: const Center(
              child: Text('お薬一覧',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                ),
              ),
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          CalendarScreen(),
          Divider(thickness: 1),
          Container(
            height: 600,
            child: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context,index) {
                return ToDoTile(
                  selectedImage: toDoList[index][0],
                  taskName: toDoList[index][1],
                  alarmTime: toDoList[index][2],
                  deleteFunction: (context)=>deleteTask(index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
    );
  }
}