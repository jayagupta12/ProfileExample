import 'model/user.dart';
import 'package:http/http.dart' as http;

class Network {
Future<List<User>> getProfiles()async{
String url="https://api.fake.rest/1fd21911-4620-405a-9b4b-914657bc71b2/getAll";

var response=await http.get(url);

var userlist=userFromJson(response.body);

return userlist;
}

}
