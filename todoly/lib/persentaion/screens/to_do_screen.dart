import 'package:flutter/material.dart';
import 'package:todoly/data/task.dart';
import 'package:intl/intl.dart';
import '../../data/timepick.dart';

class ToDoScreen extends StatefulWidget {
  List<Task> tasks;
  ToDoScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  _ToDoScreenState createState() => _ToDoScreenState(tasks: tasks);
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<Task> tasks;
  _ToDoScreenState({Key? key, required this.tasks});
  @override
  Widget build(BuildContext context) {
    tasks = tasks.where((element) => element.isDone == false).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
             Navigator.of(context).pop(tasks);
            setState(() {
              tasks.remove(tasks[index]);
            });
          },
          title: Text(
            tasks[index].taskName,
          ),
          // subtitle: Text(DateFormat().format(tasks[index].dueTime!)),
              trailing: Checkbox(
            onChanged: (val) {
              setState(() {
                tasks[index].isDone = val!;
                if (tasks[index].isDone) {
                          tasks[index].doneTime = DateTime.now();
                        }
              });
            },
            value: tasks[index].isDone,
          ),
        );
      },
      itemCount: tasks.length,
    );
  }
}
