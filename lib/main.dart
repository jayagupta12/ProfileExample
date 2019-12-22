import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profileexample/pages/homepage.dart';

import 'pages/weatherhome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([]);
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home:WeatherHome() ,
     
      
    );
  }
}