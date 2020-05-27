import 'package:provider_todo/enums/task_status.dart';
import 'package:provider_todo/model/task_model.dart';
import 'package:provider_todo/provider/task_provider.dart';
import 'package:uuid/uuid.dart';
import '../locator.dart';

class TaskService{
  TaskProvider _taskProvider = locator<TaskProvider>();
  
  addTask(Map<String , dynamic> task){
    Task.fromMap(task);
    _taskProvider.addTask(Task.fromMap(task));
  }
  
  deleteTask(String id){
    _taskProvider.deleteTask(id);
  }
}