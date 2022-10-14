import 'package:flutter/material.dart';
import 'package:world_time/fun/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'Time is loading...';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Kolkata', flag: 'assets/kolkata.img', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
    });
  }

  @override
  void initState() {
    setupWorldTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
        body: const Center(
          child: SpinKitPouringHourGlassRefined(
            color: Colors.white,
            size: 70.0,
          ),
        ),
    );
  }
}