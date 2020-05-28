import 'package:flutter/material.dart';
import 'package:provider_todo/locator.dart';
import 'package:provider_todo/model/task_model.dart';
import 'package:provider_todo/services/task_service.dart';

import 'edit_pop.dart';

class TaskDialog extends StatelessWidget {
  final Task task;
  TaskService _taskService = locator<TaskService>();

  TaskDialog({this.task});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id),
      onDismissed: (direction) => _deleteTask(),
      background: Container(
        height: 100,
        child: Center(
            child: Text("TASK DELETED SUCCESSFULLY",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xaaffffff)))),
      ),
      child: Padding(
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
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      task.status.toString().substring(11),
                      style: TextStyle(color: Color(0x88ffffff), fontSize: 15),
                    )
                  ],
                ),
                SizedBox(height: 33),
                Row(
                  children: [
                    Container(
                      child: Text(
                        task.description,
                        style:
                            TextStyle(color: Color(0x88ffffff), fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    GestureDetector(
                        onTap: (){popUp(context);},
                        child: Icon(
                          Icons.edit,
                          color: Color(0xddffffff),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  void popUp(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.black54,
        builder: (BuildContext context) {
          print(task.description);
          return EditDet(this.task);
        });
  }

  _deleteTask() {
    _taskService.deleteTask(this.task.id);
  }
}
