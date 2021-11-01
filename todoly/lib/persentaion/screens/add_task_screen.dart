import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:todoly/data/task.dart';

TextEditingController taskNameController = TextEditingController();

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.only(top: 20),
            // margin: EdgeInsets.only(top: 20),
            child: TextField(
              controller: taskNameController,
              onEditingComplete: () {
                if (taskNameController != '') {
                  Navigator.of(context).pop(taskNameController.text);
                }
              },
              decoration: InputDecoration(
                // enabled: false,
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary),
                ),
                label: Text('Task name'),
                hintText: 'Entre Task name',
                hintStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 30, top: 15),
            alignment: AlignmentDirectional.topStart,
            child: TextButton(
                onPressed: () { DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2019, 6, 7),
                      theme: DatePickerTheme(
                          headerColor: Colors.orange,
                          backgroundColor: Colors.blue,
                          itemStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          doneStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                      onChanged: (date) {
                        date.timeZoneOffset.inHours.toString();
                  }, onConfirm: (date) {
                    
                  }, currentTime: DateTime.now(), locale: LocaleType.en);},
                child: Text(
                  'Due date',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.blue)),
          ),
        ]),
      ),
      ElevatedButton(
          child: Text('Add Task'),
          onPressed: () {
            if (taskNameController != '') {
              Navigator.of(context).pop(taskNameController.text);
            }
          })
    ]);
  }
}
