import 'package:flutter/material.dart';
import 'package:profileexample/model/weatherPOJO.dart';
import 'package:profileexample/pages/WeatherDetail.dart';
import 'package:profileexample/widgets/widget.dart';

import '../weatherNetwork.dart';

class WeatherHome extends StatefulWidget {
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  var selected = "now";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: FutureBuilder(
          future: Network().getWeatherDetail(),
          builder: (BuildContext context, AsyncSnapshot<WeatherPojo> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              } else {
                return getBody(snapshot.data);
              }
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  Widget getBody(WeatherPojo data) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.6,
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WeatherDetail()));
              },
              child: new Container(
                  decoration: new BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.9), BlendMode.dstATop),
                          image:
                          NetworkImage("https://i.imgur.com/G8YwlyC.jpg")),
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
                          "${data.main.temp.round()}°C",
                          style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${data.name},${data.sys.country}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      Text(data.weather[0].main,
                          style: TextStyle(fontSize: 18, color: Colors.white))
                    ],
                  ))),
            ),
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
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.cloud_circle),
                            Text("HUMIDITY")
                          ],
                        )),
                    Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.cloud_circle),
                            Text("FEELS LIKE")
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 56),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "${data.main.humidity}%",
                              style: TextStyle(color: Colors.orange),
                            )
                          ],
                        )),
                    Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "${data.main.feelsLike.round()}%",
                              style: TextStyle(color: Colors.orange),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 43),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.cloud_circle),
                            Text("PRESSURE")
                          ],
                        )),
                    Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.cloud_circle),
                            Text("WIND")
                          ],
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 48),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              "${data.main.pressure} hPa",
                              style: TextStyle(color: Colors.orange),
                            )
                          ],
                        )),
                    Container(
                        child: Row(
                          children: <Widget>[
                            Text("${data.wind.speed.round()} mph",
                                style: TextStyle(color: Colors.orange))
                          ],
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
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
