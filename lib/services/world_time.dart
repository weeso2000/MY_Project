import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

   String location; //location name for the UI
   late String time;  //the time in the location
   String flag; // url to an asset flag icon
   String url; // location url for the api endpoint
   late bool isDaytime; //true or false if daytime or not



   WorldTime({  required this.location , required this.flag , required this.url});


  Future <void> getTime() async {

    try {
      Response response = await get(Uri.parse('http://www.worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);
      // get prop from data

      String datetime =data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);


      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // set the time properties
      isDaytime = now.hour >=  6 && now.hour < 19 ? true : false;
      time= DateFormat.jm().format(now);

    }
    catch (e) {
      print('caught error: $e');
      time = 'caught not get time data' ;
    }
  }
}


