import 'package:flutter/material.dart';

class WeatherHome extends StatefulWidget {
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  var selected = "now";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("New York")),
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 22.0, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.dashboard,
          color: Colors.black,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search, color: Colors.black),
          )
        ],
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              color: Colors.transparent,
              child: new Container(
                  decoration: new BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.9), BlendMode.dstATop),
                          image: NetworkImage(
                              "https://images.wallpaperscraft.com/image/buildings_city_building_top_view_119746_3840x2400.jpg")),
                      borderRadius: new BorderRadius.all(Radius.circular(30))),
                  child: new Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "images/cloudy-night.png",
                        height: 100,
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "25°C",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Delhi,Country",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      Text("Scattered Clouds",
                          style: TextStyle(fontSize: 18, color: Colors.white))
                    ],
                  ))),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    dayWidget("now", "images/cloudy-night.png"),
                    dayWidget("19", "images/cloudy-night.png"),
                    dayWidget("20", "images/cloudy-night.png"),
                    dayWidget("21", "images/cloudy-night.png"),
                    dayWidget("22", "images/cloudy-night.png"),
                  ],
                ),
              ),
            ),
            Column(
              
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[Icon(Icons.cloud), Text("HUMIDITY")],
                          ),
                          Text("75%")
                        ],
                      ),
                    ),
                     Container(
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[Icon(Icons.cloud), Text("FEELS LIKE")],
                          ),
                          Text("75%")
                        ],
                      ),
                    ),
                    
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.cloud),
                              Text("RAIN")
                            ],
                          ),
                          Text("75%")
                        ],
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget dayWidget(String text, String imgpath) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = text;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AnimatedContainer(
            curve: Curves.linear,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.circular(10),
              color: selected == text ? Colors.orange : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                        color: selected == text ? Colors.white : Colors.black),
                  ),
                  Image.asset(
                    imgpath,
                    width: 50,
                    height: 50,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
