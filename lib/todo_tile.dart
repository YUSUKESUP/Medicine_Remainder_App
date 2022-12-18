import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final String selectedImage;
  final String alarmTime;
  Function(BuildContext)?  deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.selectedImage,
    required this.deleteFunction,
    required this.alarmTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
              padding: EdgeInsets.all(20),
              height: 130,
              child: Column(

                children: [
                  Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(child:
                      Image.asset(selectedImage),height: 60,width: 60,),

                      Text(taskName,
                        maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Text(alarmTime),
                ],
              ),
            ),
          ),

        ),
      );
  }
}