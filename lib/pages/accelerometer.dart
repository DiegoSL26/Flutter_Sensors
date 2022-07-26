import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Accelerometer extends StatefulWidget {
  const Accelerometer({Key? key}) : super(key: key);

  @override
  State<Accelerometer> createState() => _AccelerometerState();
}

class _AccelerometerState extends State<Accelerometer> {
  // ignore: prefer_typing_uninitialized_variables
  var xCoords;
  // ignore: prefer_typing_uninitialized_variables
  var yCoords;
  // ignore: prefer_typing_uninitialized_variables
  var zCoords;

  void initAccelerometer() {
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        xCoords = event.x.toStringAsFixed(3);
        yCoords = event.y.toStringAsFixed(3);
        zCoords = event.z.toStringAsFixed(3);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accelerometer'),
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
                        onPressed: initAccelerometer,
                        child: const Text('Init Accelerometer')),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
