import 'package:flutter/material.dart';
import 'package:todoly/data/task.dart';
import 'package:intl/intl.dart';

class DoneScreen extends StatefulWidget {
  List<Task> tasks;
  DoneScreen({Key? key, required this.tasks}) : super(key: key);

  @override
  _DoneScreenState createState() => _DoneScreenState(tasks: tasks);
}

class _DoneScreenState extends State<DoneScreen> {
  List<Task> tasks;
  _DoneScreenState({Key? key, required this.tasks});
  @override
  Widget build(BuildContext context) {
    tasks = tasks.where((element) => element.isDone == true).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onLongPress: () {},
          title: Text(
            tasks[index].taskName,
          ),
          trailing: tasks[index].doneTime != null
              ? Text(DateFormat().format(tasks[index].doneTime!))
              : null,
        );
      },
      itemCount: tasks.length,
    );
  }
}
