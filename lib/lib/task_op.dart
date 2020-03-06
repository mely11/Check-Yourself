import 'package:todo_app/task.dart';

// JUST FOR REFERENCE!
// class Task {
//   final int id;
//   final String name;
//   final bool done;

//   Task(this.id, this.name, this.done);
// }

class ChangeTaskStatus {
  final Task task;
  final bool status;
  ChangeTaskStatus(this.task, this.status);
}

class RemoveTask {
  final Task task;
  RemoveTask(this.task);
}

class AddTask {
  final String taskStr;
  AddTask(this.taskStr);
}
