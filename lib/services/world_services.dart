import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String offset = data['utc_offset'];
      String dateTime = data['datetime'];
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset.substring(1,3))));
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    }
    catch(e){
      print('exception thrown: $e');
      time = 'could not load time';
    }

  }
}


