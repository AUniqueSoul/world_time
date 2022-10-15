import 'package:flutter/material.dart';
import 'package:world_time/fun/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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
      'isDaytime': instance.isDaytime,
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SpinKitWanderingCubes(
                color: Colors.white,
                size: 70.0,
              ),
              const SizedBox(height: 30.0),
              Text('Loading data...',
              style: GoogleFonts.fuzzyBubbles(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),),
            ],
          ),
        ),
    );
  }
}