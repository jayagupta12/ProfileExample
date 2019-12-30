import 'package:http/http.dart' as http;
import 'package:profileexample/model/weatherForcast.dart';

import 'model/weatherPOJO.dart';

class Network {
  Future<WeatherPojo> getWeatherDetail() async {
    String url =
        "http://api.openweathermap.org/data/2.5/weather?lat=28.67&lon=77.22&APPID=af8c1782716779e3f02b14e704561035&units=metric";

    var response = await http.get(url);

    WeatherPojo weatherdetail = weatherPojoFromJson(response.body);

    return weatherdetail;
  }

  Future<WeatherForcast> getWeatherForcast() async {
    String url =
        "http://api.openweathermap.org/data/2.5/forecast?lat=28.67&lon=77.22&APPID=af8c1782716779e3f02b14e704561035&units=metric";
    var response = await http.get(url);
    return weatherForcastFromJson(response.body);
  }
}
