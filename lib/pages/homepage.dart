import 'package:flutter/material.dart';
import 'package:profileexample/model/user.dart';
import 'package:profileexample/pages/profilepage.dart';

import '../networkfile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        body: FutureBuilder(
          future: Network().getProfiles(),
          builder: (context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.connectionState == ConnectionState.none ||
                snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue
                ),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
                    leading: Hero(
                      tag: snapshot.data[index].name,
                      child: Icon(Icons.person),
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage(snapshot.data[index])));
                    },
                  );
                },
                itemCount: snapshot.data.length,
              );
            }
          },
        ));
  }
}
