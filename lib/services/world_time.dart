import 'dart:convert';
import 'package:http/http.dart' as http;

class WorldTime {
  late String location; // location name for UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint

  WorldTime(this.location,this.flag,this.url);

  Future<void> getTime() async {
    // make the request

    var uri = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
    http.Response response = await http.get(uri);
    Map data = jsonDecode(response.body);

    // get properties from json
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    print(now);

    // set the time property
    time = now.toString();
  }
}