import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/enums/task_status.dart';
import 'package:provider_todo/model/task_model.dart';
import 'package:provider_todo/presentation/landing_components/task_dialogue.dart';
import 'package:provider_todo/presentation/landing_components/user_input.dart';
import 'package:provider_todo/provider/task_provider.dart';

import 'landing_components/app_bar.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  Task task = new Task(
      title: "TITLE OF TASK",
      description: "HERE IS THE DESCRIPTION OF THE ABOVE TASK",
      status: TaskStatus.OPEN);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xff0c0c0c),
          body: Stack(
            children: [
              Align(
                  alignment: Alignment(0, -1),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Consumer<TaskProvider>(
                          builder: (ctx, provider, child) {
                        return ListView.builder(
                            itemCount: provider.tasks.length,
                            itemBuilder: (ctx, index) => TaskDialog(
                                  task: provider.tasks[index],
                                ));
                      }))),
              UserInput(),
              MyAppBar()
            ],
          )),
    );
  }
}
