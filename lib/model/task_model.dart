import 'package:provider_todo/enums/task_status.dart';
import 'package:flutter/material.dart';

class Task {
  String id;
  String title;
  String description;
  TaskStatus status;

  Task(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.status});

  Task.fromMap(Map<String , dynamic> map){
    id = map['id'];
    title = map['title'];
    description = map['description'];
    status = map['status'];
  }
}
