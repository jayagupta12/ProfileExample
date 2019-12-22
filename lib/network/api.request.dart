import 'package:http/http.dart' as http;
import 'package:weather_app/models/User.dart';
import 'package:weather_app/models/usermodel.dart';

class API {
     Future<List<Welcome>> getPosts() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List<Welcome> users=welcomeFromJson(response.body);

    return users;
  }
  Future<List<Datum>> getUserProfile() async{
var url='https://reqres.in/api/users';
var res=await http.get(url);
User resp_data=userFromJson(res.body);
List<Datum> users=resp_data.data;

    return users ;
  }
}

