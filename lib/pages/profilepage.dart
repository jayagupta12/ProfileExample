import 'package:flutter/material.dart';
import 'package:profileexample/model/user.dart';
import 'package:profileexample/widgets/widget.dart';

class ProfilePage extends StatelessWidget {
  User user;
  ProfilePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
               getFirstContainer(context,user),
                getSecondContainer(context,user),
              ],
            ),
          ),
        ));
  }
}
