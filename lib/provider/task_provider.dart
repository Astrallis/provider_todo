import 'package:flutter/widgets.dart';
import 'package:provider_todo/model/task_model.dart';

class TaskProvider with ChangeNotifier{

    List<Task> _tasks = [];
    List<Task> get tasks => _tasks;
    set tasks(List<Task> task){
      _tasks=task;
      notifyListeners();
    }

    addTask(Task task){
      _tasks.add(task);
      notifyListeners();
    }

    deleteTask(String id){
      _tasks.removeWhere((t)=> t.id==id);
      notifyListeners();
    }
}