import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wold_time/services/world_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime WTinstance = WorldTime(location: 'Sarajevo', flag: 'germany.png', url: '/Europe/Sarajevo');
    await WTinstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': WTinstance.location,
      'flag': WTinstance.flag,
      'time': WTinstance.time,
      'isDayTime': WTinstance.isDayTime,
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
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
