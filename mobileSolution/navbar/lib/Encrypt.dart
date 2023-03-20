import 'package:flutter/material.dart';

class Encrypt extends StatefulWidget {
  Encrypt({Key? key}) : super(key: key);

  @override
  State<Encrypt> createState() => _EncryptState();
}

class _EncryptState extends State<Encrypt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text('Encrypt'),
        ),
      ),
    );
  }
}
