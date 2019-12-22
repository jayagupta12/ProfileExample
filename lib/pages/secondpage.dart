import 'package:flutter/material.dart';




class SecondPage extends StatelessWidget {

   final String title,lastname;
  SecondPage({Key key, @required this.title,@required this.lastname}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child: Text("$title $lastname"),
      ),
    );
  }
}
