import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:profileexample/model/weatherForcast.dart';

import 'package:profileexample/widgets/widget.dart';

import '../weatherNetwork.dart';

class WeatherDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: FutureBuilder(
        future: Network().getWeatherForcast(),
        builder:
            (BuildContext context, AsyncSnapshot<WeatherForcast> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            } else {
              return getBody(snapshot.data, context);
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget getBody(WeatherForcast data, BuildContext context) {
    return Container(
        child: ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage("https://i.imgur.com/G8YwlyC.jpg"))),
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              dayWidget(
                  DateFormat("EEEE").format(DateTime.fromMillisecondsSinceEpoch(
                      data.list[0].dt * 1000 + 19800)),
                  "images/cloudy-night.png",
                  data.list[0].main.tempMin,
                  data.list[0].main.tempMax,
                  context),
              dayWidget(
                  DateFormat("EEEE").format(DateTime.fromMillisecondsSinceEpoch(
                      data.list[8].dt * 1000 + 19800)),
                  "images/cloudy-night.png",
                  data.list[8].main.tempMin,
                  data.list[8].main.tempMax,
                  context),
              dayWidget(
                  DateFormat("EEEE").format(DateTime.fromMillisecondsSinceEpoch(
                      data.list[16].dt * 1000 + 19800)),
                  "images/cloudy-night.png",
                  data.list[16].main.tempMin,
                  data.list[16].main.tempMax,
                  context),
              dayWidget(
                  DateFormat("EEEE").format(DateTime.fromMillisecondsSinceEpoch(
                      data.list[24].dt * 1000 + 19800)),
                  "images/cloudy-night.png",
                  data.list[24].main.tempMin,
                  data.list[24].main.tempMax,
                  context),
              dayWidget(
                  DateFormat("EEEE").format(DateTime.fromMillisecondsSinceEpoch(
                      data.list[32].dt * 1000 + 19800)),
                  "images/cloudy-night.png",
                  data.list[32].main.tempMin,
                  data.list[32].main.tempMax,
                  context),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.tintSlash),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("HUMIDITY"),
                      ),
                    ],
                  )),
              Container(
                  child: Row(
                children: <Widget>[
                  Icon(Icons.cloud),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("FEELS LIKE"),
                  ),
                ],
              )),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Row(
                    children: <Widget>[
                      Text("${data.list[0].main.humidity}%"),
                    ],
                  )),
              Container(
                  child: Row(
                children: <Widget>[
                  Text("${data.list[0].main.feelsLike.round()}%"),
                ],
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.cloud),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("CHANCES OF RAIN"),
                      ),
                    ],
                  )),
              Container(
                  child: Row(
                children: <Widget>[
                  Icon(Icons.cloud),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("WIND          "),
                  ),
                ],
              )),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Row(
                    children: <Widget>[
                      Text("75%"),
                    ],
                  )),
              Container(
                  child: Row(
                children: <Widget>[
                  Text("${data.list[0].wind.speed.round()} mph"),
                ],
              )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.cloud),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("PRESSURE"),
                      ),
                    ],
                  )),
              Container(
                  child: Row(
                children: <Widget>[
                  Icon(Icons.cloud),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("SUNRISE    "),
                  ),
                ],
              )),
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Row(
                    children: <Widget>[
                      Text("${data.list[0].main.pressure} hPa"),
                    ],
                  )),
              Container(
                  child: Row(
                children: <Widget>[
                  Text(DateFormat("hh:mm a").format(
                      DateTime.fromMillisecondsSinceEpoch(
                          data.city.sunrise * 1000))),
                ],
              )),
            ],
          ),
        ),
      ],
    ));
  }

  Widget dayWidget(
    String text,
    String imgpath,
    double tempMin,
    double tempMax,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width * 0.3, child: Text(text)),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Image.asset(imgpath, width: 50, height: 50),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text("${tempMin.round()}°C"),
        ),
        Text("${tempMax.round()}°C"),
      ],
    );
  }
}
