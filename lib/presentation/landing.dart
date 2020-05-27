import 'package:flutter/material.dart';
import 'package:provider_todo/presentation/landing_components/user_input.dart';

import 'landing_components/app_bar.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xff0c0c0c),
          body: Stack(
            children: [
              UserInput(),
              MyAppBar() 
            ],
          )),
    );
  }
}
