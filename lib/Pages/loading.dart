import 'package:flutter/material.dart';
import 'package:untitled/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Istanbul', flag: 'turkey.png', url: 'asia/istanbul');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/location', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.teal[900],
          size: 70.0,
        ),
      ),
    );
  }
}
