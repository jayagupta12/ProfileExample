import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profileexample/model/user.dart';

Widget getFirstContainer(BuildContext context,User user) {
  return Container(
    height: MediaQuery.of(context).size.height / 2,
    width: MediaQuery.of(context).size.width,
    child: Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Hero(
          tag: user.name,
          child: Container(
            width: 150,
            height: 150,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://avatars3.githubusercontent.com/u/26568691?s=400&v=4"))),
          ),
        ),
      ]),
    ),
  );
}

Widget getSecondContainer(BuildContext context, User user) {
  return Container(
    height: MediaQuery.of(context).size.height / 2,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              user.name,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                user.email,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      user.company.bs,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Flexible(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            user.company.name,
                            style: TextStyle(color: Colors.white),
                          ))),
                  Flexible(
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            user.phone,
                            style: TextStyle(color: Colors.white),
                          ))),
                ],
              ),
            ),
            Divider(
              height: 6,
              thickness: 4,
              color: Colors.white,
            )
          ],
        ),
      ),
    ),
  );
}
