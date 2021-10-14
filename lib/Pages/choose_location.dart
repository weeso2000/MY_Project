import 'package:flutter/material.dart';
import 'package:untitled/services/world_time.dart';

class chooselocation extends StatefulWidget {
  const chooselocation({Key? key}) : super(key: key);

  @override
  _chooselocationState createState() => _chooselocationState();
}

class _chooselocationState extends State<chooselocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Jerusalem', location: 'Palestine', flag: 'Palestine.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Germany', flag: 'germany.png'),
    WorldTime(url: 'Europe/London', location: 'United Kingdom', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Greece', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Egypt', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Kenya', flag: 'kenya.png'),
    WorldTime(url: 'Asia/Seoul', location: 'South Korea', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Indonesia', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/istanbul', location: 'Turkey', flag: 'turkey.png'),
      ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: const Text('Choose a location'),
          centerTitle: true,
          elevation: 0,
        ),

        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 1.0, horizontal: 4.0),
              child: Card(
                color: Colors.black12,
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}

