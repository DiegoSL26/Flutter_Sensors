import 'package:flutter/material.dart';
import 'package:sensors_test/pages/accelerometer.dart';
import 'package:sensors_test/pages/authetication.dart';
import 'package:sensors_test/pages/gyroscope.dart';
import 'package:sensors_test/pages/proximity.dart';

//sensors library
//import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sensors Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Sensors Demo Page'),
        routes: <String, WidgetBuilder>{
          '/accelerometer': (BuildContext context) => const Accelerometer(),
          '/gyroscope': (BuildContext context) => const Gyroscope(),
          '/proximity': (BuildContext context) => const Proximity(),
          '/authentication': (BuildContext context) => const Authentication(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Press a button to try a sensor',
            ),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: (() =>
                            Navigator.pushNamed(context, '/accelerometer')),
                        child: const Text('Accelerometer')),
                    ElevatedButton(
                        onPressed: (() =>
                            Navigator.pushNamed(context, '/gyroscope')),
                        child: const Text('Gyroscope')),
                    ElevatedButton(
                        onPressed: (() =>
                            Navigator.pushNamed(context, '/proximity')),
                        child: const Text('Proximity')),
                    ElevatedButton(
                        onPressed: (() =>
                            Navigator.pushNamed(context, '/authentication')),
                        child: const Text('Fingerprint'))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
