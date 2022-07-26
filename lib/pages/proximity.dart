import 'package:flutter/material.dart';
import 'package:all_sensors/all_sensors.dart';

class Proximity extends StatefulWidget {
  const Proximity({Key? key}) : super(key: key);

  @override
  State<Proximity> createState() => _ProximityState();
}

class _ProximityState extends State<Proximity> {
  // ignore: prefer_typing_uninitialized_variables
  var proximityValues;

  void initProximity() {
    proximityEvents!.listen((ProximityEvent event) {
      setState(() {
        proximityValues = event.getValue();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proximity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Proximity Values: $proximityValues',
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: initProximity,
                        child: const Text('Init Proximity')),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
