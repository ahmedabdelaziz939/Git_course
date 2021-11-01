import 'package:flutter/material.dart';
import 'package:todoly/persentaion/screens/add_task_screen.dart';
import 'package:todoly/persentaion/screens/home_screen.dart';
import 'package:todoly/persentaion/themes/app_themes.dart';

import 'data/task.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      List<Task> tasks;
    return MaterialApp(
      title: 'ToDoly',
      theme: AppThemes.lightTheme,
      home: HomeScreen(),
      routes: {
        'home' : (context)=>HomeScreen(),
        '/add_task': (context) => AddTaskScreen()
      },
    );
  }
}
