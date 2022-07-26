import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  LocalAuthentication auth = LocalAuthentication();
  String authorized = "Not authorized";

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          localizedReason: "Scan your fringer to authenticate",
          options: const AuthenticationOptions(biometricOnly: true));
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e);
    }

    if (!mounted) return;

    setState(() {
      authorized =
          authenticated ? "Authorized acces" : "Failed to authenticate";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fingerprint Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Fingerprint Authentication',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Container(
                margin: const EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: _authenticate,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 70),
                          shape: const BeveledRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                        child: const Text('Press here to \n authenticate',
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center)),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 50, top: 30, right: 50),
                      child: Text(
                        'Response: $authorized',
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
