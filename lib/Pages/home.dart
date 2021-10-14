import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    
   data = data.isNotEmpty ? data: ModalRoute.of(context)!.settings.arguments as Map;

    // set background
   String bgImage;
   bgImage = data['isDaytime'] ? 'day.jpg' : 'Night.jpg';
   Color bgColor = data['isDaytime'] ? Colors.white12 : Colors.black12;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image:  DecorationImage(
                image: AssetImage('assets/$bgImage'),
              fit : BoxFit.cover ,
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0 , 240 , 0 , 0),
              child: Column(
               children: <Widget> [
                  TextButton.icon(
                       onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDaytime' : result['isDaytime'],
                        'flag' : result['flag'],
                          };
                    });
                   },
                    icon:Icon(
                      Icons.location_on_outlined ,
                      color: Colors.teal[800],
                    ),
                    label: Text(
                       'Change location',
                     style: TextStyle(
                       fontSize: 20.0,
                       color: Colors.teal[800],
                     ),
                   ),
               ),
                const SizedBox(height: 5.0),
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Text(
                     data['location'],
                          style: const TextStyle(
                           fontSize: 25.0,
                           letterSpacing: 2.5,
                             color : Colors.white54,
                    ),
                  ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Text(
                  data['time'],
                 style:  const TextStyle(
                   fontSize: 66.0,
                    color: Colors.white54,
                  ),
                )
              ],
            ),
         ),
        ),
     ),
    );
  }
}
