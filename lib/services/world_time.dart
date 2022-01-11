import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {

  late String location; // location name for the UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late int dayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    //  make the request
    Response response = await get(Uri.http('worldtimeapi.org','/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties from data

    String datetime = data['datetime'];
    String offset = data['utc_offset'];

    // create DateTime object

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset.substring(0,3))));
    now = now.add(Duration(minutes: int.parse(offset.substring(4,6))));

    // set the time property
    print(now.hour);
    if (now.hour >= 7 && now.hour < 9) {
      dayTime = 1;
    }
    else if (now.hour >= 9 && now.hour < 16) {
      dayTime = 2;
    }
    else if (now.hour >= 16 && now.hour < 18) {
      dayTime = 3;
    }
    else if (now.hour >= 18 && now.hour < 19) {
      dayTime = 4;
    }
    else if (now.hour >= 5 && now.hour < 7) {
      dayTime = 6;
    }
    else {
      dayTime = 5;
    }

    time = DateFormat.jm().format(now);
  }

}

