import 'package:flutter/material.dart';
import 'package:todoly/data/task.dart';

class AllTasks extends StatefulWidget {
  List<Task> tasks;
  AllTasks({Key? key, required this.tasks}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState(tasks: tasks);
}

class _AllTasksState extends State<AllTasks> {
  List<Task> tasks;
  _AllTasksState({required this.tasks});
  @override
  Widget build(BuildContext context) {
    tasks = tasks;
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            tasks.remove(tasks[index]);
          },
          title: Text(
            tasks[index].taskName,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  decoration:
                      tasks[index].isDone ? TextDecoration.lineThrough : null,
                ),
          ),
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
