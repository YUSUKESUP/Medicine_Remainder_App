import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_medicine_remainder/select_medicine.dart';
import 'my_button.dart';

class DialogBox extends StatefulWidget {
  final controller;
  final timeController;
  VoidCallback onSave;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.timeController,

  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {


  DateTime  selectedDate = DateTime.now();



  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: widget.controller,
              style: TextStyle(

                fontSize: 20,
              ),
              decoration: InputDecoration(

                suffix: IconButton(icon: Icon(Icons.clear),
                onPressed: ()=>
                  widget.controller.clear(),
                ),
                 contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                 labelText: '薬の名前',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 0.5)
                  ),
              ),
            ),
            TextField(
              controller: widget.timeController,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                labelText: '時間の設定',
                border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(width: 0.5)
                ),
              ),
              onTap: (){
              showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context)
                  =>SizedBox(
                    height: 300,
                    child: CupertinoDatePicker(
                      backgroundColor: Colors.white,
                      initialDateTime: selectedDate,
                      mode: CupertinoDatePickerMode.time,
                      onDateTimeChanged:(newDate){
                        String time = DateFormat('H:mm').format(newDate);
                        selectedDate = newDate;
                        widget.timeController.text = time;
                        setState(() {
                        });
                      } ,
                    ),
                  )
              );
              },
            ),
            SelectCard(),
          MyButton(text: '保存', onPressed: widget.onSave),

          ],
        ),
      ),
    );
  }
}