import 'package:flutter/material.dart';
import 'package:todoly/data/task.dart';
import 'package:todoly/persentaion/screens/add_task_screen.dart';
import 'package:todoly/persentaion/screens/done_screen.dart';
import 'package:todoly/persentaion/screens/to_do_screen.dart';
import 'all.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _taskNameController = TextEditingController();
  int _selectedIndex = 0;
  List<Task> tasks = [
    Task(taskName: 'eat breakfast'),
    Task(taskName: 'drink cofee'),
    Task(taskName: 'morning training'),
    Task(taskName: 'go to work')
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _page = [
      AllTasks(tasks: tasks),
      ToDoScreen(tasks: tasks),
      DoneScreen(tasks: tasks),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Organize Your tasks')),
      body: _page.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.grey[200],
        iconSize: 30,
        selectedFontSize: 18,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'All tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'To do'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Done'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
           String text= await showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTaskScreen();
              });
            
          setState(() {
            if (text != '') {
              tasks.add(Task(taskName: text));
              
            }
            

            // tasks.add(Task(taskName: text));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
//Navigator.of(context).pushNamed('/add_task') as String;

// tabs: [
//               Tab(
//                 text: 'All Tasks',
//               ),
//               Tab(
//                 text: 'To Do',
//               ),
//               Tab(
//                 text: 'DOne',
//               ),
//             ],
//           ),

// TabBarView(
//           children: [
//             ListView.builder(
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(
//                     tasks[index].taskName,
//                     style: Theme.of(context).textTheme.bodyText2!.copyWith(
//                           decoration: tasks[index].isDone
//                               ? TextDecoration.lineThrough
//                               : null,
//                         ),
//                   ),
//                   trailing: Checkbox(
//                     onChanged: (val) {
//                       setState(() {
//                         print(tasks[index].taskName);
//                         tasks[index].isDone = val!;
//                         print(tasks[index].isDone);
//                       });
//                     },
//                     value: tasks[index].isDone,
//                   ),
//                 );
//               },
//               itemCount: tasks.length,
//             ),
//             ToDoScreen(),
//             DoneScreen(),
//           ],
//         ),
