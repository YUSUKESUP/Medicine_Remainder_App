import 'package:flutter/material.dart';
import '../todo_tile.dart';
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
        title: Text('お薬一覧'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
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
    );
  }
}