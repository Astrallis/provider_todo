import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment(0, -1),
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xff0c0c0c),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, -4),
                    blurRadius: 10)
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              children: [
                Text("YOUR TODO",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white70),)
              
            ],),
          )
        ));
  }
}
