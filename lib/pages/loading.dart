import 'package:flutter/material.dart';
import 'package:lab5_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Kuala Lumpur',
        flag: 'malaysia.png',
        url: 'Asia/Kuala_Lumpur');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
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
        backgroundColor: Color(0xff00003f),
        body: Center(
            child: SpinKitRotatingCircle(
          color: Colors.grey,
          size: 50.0,
        )));
  }
}
