import 'package:provider_todo/enums/task_status.dart';

class Task {
  String id;
  String title;
  String description;
  TaskStatus status;

  Task({this.id,this.title,this.description,this.status});
}