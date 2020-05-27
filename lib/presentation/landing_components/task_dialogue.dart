import 'package:flutter/material.dart';
import 'package:provider_todo/locator.dart';
import 'package:provider_todo/model/task_model.dart';
import 'package:provider_todo/services/task_service.dart';

class TaskDialog extends StatelessWidget {
  final Task task;
  TaskService _taskService = locator<TaskService>();

  TaskDialog({this.task}) ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffA4508B),
                Color(0xff5F0A87),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.white12,
                  offset: Offset(-4, -4),
                  blurRadius: 10),
              BoxShadow(
                  color: Colors.black, offset: Offset(4, 4), blurRadius: 10)
            ]),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Wrap(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    child: Text(
                      task.title,
                      style: TextStyle(
                          color: Color(0xddffffff),
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(child: Container(),),
                  Text(task.status.toString().substring(11),
                style: TextStyle(color: Color(0x88ffffff), fontSize: 15),)
                ],
              ),
              SizedBox(height: 33),
              Row(
                children: [
                  Container(
                    child: Text(
                      task.description,
                      style: TextStyle(color: Color(0x88ffffff), fontSize: 15),
                    ),
                  ),
                  Expanded(child: Container(),),
                  GestureDetector(onTap: _deleteTask(),child: Icon(Icons.delete,color: Color(0xddffffff),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  _deleteTask(){
    _taskService.deleteTask(this.task.id);
  }
}
