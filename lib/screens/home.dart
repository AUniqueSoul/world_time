import 'package:flutter/material.dart';

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
    print(data);
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: const Icon(Icons.edit_location_alt),
                    label: const Text('Edit location')),
                const SizedBox(height: 40.0),
                Text(data['location'],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),),
                const SizedBox(height: 30.0),
                Text(data['time'],
                  style: const TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 25.0,
                  ),),
              ],
            ),
          )),
    );
  }
}