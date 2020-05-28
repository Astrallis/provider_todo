import 'package:flutter/material.dart';
import 'package:provider_todo/enums/task_status.dart';
import 'package:provider_todo/locator.dart';
import 'package:provider_todo/model/task_model.dart';
import 'package:provider_todo/services/task_service.dart';
import 'package:uuid/uuid.dart';

class EditDet extends StatefulWidget {
  Task task;
  EditDet(Task task)
  {
    this.task=task;
    print("Constructor 1");
  }
  
  @override
  _EditDetState createState() => _EditDetState(task);
}

class _EditDetState extends State<EditDet> {
  Task task;
  _EditDetState(Task task){
    this.task=task;
    print("Constructor 2");
  }
  final FocusNode titleFocusNode = new FocusNode();
  bool prioritize;

  TaskService _taskService=locator<TaskService>();

  final TextEditingController titleController = new TextEditingController();
  final TextEditingController descController = new TextEditingController();

  @override
  void initState() {
    titleController.text=task.title;
    descController.text=task.description;
    prioritize = false;
    // TODO: implement initState
    super.initState();
  }
    var uid=new Uuid();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          // height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
              color: Color(0xff0c0c0c),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("EDIT TASK",
                    style: TextStyle(
                        color: Color(0xffdddddd),
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    focusNode: titleFocusNode,
                    decoration: InputDecoration(
                      labelText: "TASK TITLE",
                      labelStyle:
                          TextStyle(color: Colors.white38, fontSize: 17),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                    ),
                    controller: titleController),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 6,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      labelText: "TASK DESCRIPTION",
                      labelStyle:
                          TextStyle(color: Colors.white38, fontSize: 14),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white60),
                      ),
                    ),
                    controller: descController),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: () {
                    print("DATE PICKER KHOLUNGA");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Color(0xffdddddd),
                        size: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Schedule Task",
                          style: TextStyle(
                              color: Color(0xffdddddd),
                              fontWeight: FontWeight.w300,
                              fontSize: 18))
                    ],
                  ),
                  color: Color(0x0c0c0c),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){_updateTask();Navigator.pop(context);},
                                  child: Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffA4508B),
                              Color(0xff5F0A87),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(90),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white12,
                                offset: Offset(-4, -4),
                                blurRadius: 10),
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(4, 4),
                                blurRadius: 10)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "APPLY CHANGES",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          SizedBox(width: 10)
                        ],
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: prioritize,
                      onChanged: (bool t) {
                        setState(() {
                          prioritize = !prioritize;
                        });
                      },
                      activeColor: Color(0xffA4508B),
                      checkColor: Colors.white,
                      hoverColor: Colors.white,
                    ),
                    Text(
                      "Prioritize ?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                )
              ],
            ),
          )),
    ));
  }
  _updateTask(){
    Map<String, dynamic> map={
      'title': titleController.text,
      'description': descController.text,
      'id': task.id,
      'status': task.status
    };
    _taskService.updateTask(map);
  }
}
