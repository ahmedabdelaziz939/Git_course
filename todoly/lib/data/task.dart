class Task {
  final String taskName;
  DateTime? dueTime;
  bool isDone;
  DateTime? doneTime;
  Task({required this.taskName, this.isDone = false,this.dueTime});
}
