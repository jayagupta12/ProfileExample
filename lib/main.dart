import 'package:flutter/material.dart';
import 'package:weather_app/models/usermodel.dart';
import 'package:weather_app/network/api.request.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/pages/secondpage.dart';

import 'models/User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title}) : super();
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: FutureBuilder(
            future: getUserProfile(),
            builder: (context, AsyncSnapshot<List<Datum>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.data == null) {
                return CircularProgressIndicator();
              }

              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        "${snapshot.data[index].firstName} ${snapshot.data[index].lastName}"),
                    subtitle: Text(snapshot.data[index].email),
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          NetworkImage(snapshot.data[index].avatar),
                    ),
                    onTap: () {
                      Navigator.push(
                                              context,
                        MaterialPageRoute(builder: (context) { return SecondPage(title:snapshot.data[index].firstName,lastname:snapshot.data[index].lastName);},
                        ),
                      );
                    },
                  );
                },
                itemCount: snapshot.data.length,
              );
            },
          ),
        ),
      ),
    );
  }
}

Future<List<Datum>> getUserProfile() async {
  var url = 'https://reqres.in/api/users';
  var res = await http.get(url);
  User resp_data = userFromJson(res.body);
  List<Datum> users = resp_data.data;

  return users;
}


