import 'package:flutter/material.dart';

class Decrypt extends StatefulWidget {
  Decrypt({Key? key}) : super(key: key);

  @override
  State<Decrypt> createState() => _DecryptState();
}

class _DecryptState extends State<Decrypt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text('Decrypt Page'),
        ),
      ),
    );
  }
}
