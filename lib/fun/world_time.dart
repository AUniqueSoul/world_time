import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

 class WorldTime {

   late bool  isDaytime;
   late String datetime, offset, location, time, flag, url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      datetime = data['datetime'];
      offset = data['utc_offset'].substring(1,3);
      DateTime dt = DateTime.parse(datetime);
      dt = dt.add(Duration(hours: int.parse(offset)));
      // print(datetime);
      // print(offset);
      // print(dt);
      isDaytime = dt.hour > 5 && dt.hour < 20 ? true : false;
      print(dt.hour);
      print(isDaytime);
      time = DateFormat.jm().format(dt);
    } catch(e){
      time = 'failed to update date!';
    }
  }
}