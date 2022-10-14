import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

 class WorldTime {

  String datetime="", offset="", location="", time="", flag="", url="";

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try{
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      datetime = data['datetime'];
      offset = data['utc_offset'].substring(1,3);
      DateTime dt = DateTime.parse(datetime);
      dt = dt.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(dt);
    } catch(e){
      print(e);
      time = 'failed to update date!';
    }
  }
}