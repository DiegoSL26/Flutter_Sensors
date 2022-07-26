import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Gyroscope extends StatefulWidget {
  const Gyroscope({Key? key}) : super(key: key);

  @override
  State<Gyroscope> createState() => _GyroscopeState();
}

class _GyroscopeState extends State<Gyroscope> {
  // ignore: prefer_typing_uninitialized_variables
  var xCoords;
  // ignore: prefer_typing_uninitialized_variables
  var yCoords;
  // ignore: prefer_typing_uninitialized_variables
  var zCoords;

  void initGyroscope() {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      xCoords = event.x;
      yCoords = event.y;
      zCoords = event.z;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gyroscope'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'X coords:$xCoords',
            ),
            Text(
              'Y coords:$yCoords',
            ),
            Text(
              'Z coords:$zCoords',
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: initGyroscope,
                        child: const Text('Init Gyroscope')),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
