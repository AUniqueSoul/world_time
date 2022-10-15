import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String time='';
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map;

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDaytime'] ? Colors.blue[400] : Colors.deepPurple[800];
    Color? btnColor = data['isDaytime'] ? Colors.lightBlue[400] : Colors.deepPurple[800];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/location');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(btnColor!),
                      ),
                      icon: const Icon(
                          Icons.edit_location_alt,
                          color: Colors.white),
                      label: Text(
                          'Edit location',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          )),
                  ),
                  const SizedBox(height: 40.0),
                  Text(data['location'],
                  style: GoogleFonts.acme(
                    color: Colors.white,
                    fontSize: 30.0,
                  )),
                  const SizedBox(height: 30.0),
                  Text(data['time'],
                    style: GoogleFonts.bizUDPMincho(
                      textStyle: const TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                      ),
                    )),
                ],
              ),
            ),
          )),
    );
  }
}