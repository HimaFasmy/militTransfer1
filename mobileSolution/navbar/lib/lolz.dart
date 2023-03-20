import 'package:flutter/material.dart';

class lolz extends StatefulWidget{
  lolz({Key? key}) : super(key: key);
  @override
  State<lolz> createState() => _lolzState();

}
  class _lolzState extends State<lolz> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'militTransfer',
            style: TextStyle(
              fontFamily: 'ErasBod',
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black, //should work with primary color
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  "ABOUT US",
                  style: TextStyle(
                    fontFamily: 'ErasBod',
                    fontSize: 32,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  'Welcome to our CTRL C+ CTRL V, We are a group of dedicated individuals with a passion for technology and security. \n\nOur goal is to create innovative solutions that help users protect their information and communicate securely.\n\nmilitTransfer is an Image Steganographic software, which allows users to conceal secret messages within images. This powerful tool can be used for a variety of purposes, including secure communication, data protection and so on.\n\nThank you for choosing us, and we look forward to serving you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'firaCode',
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    //height: 1.3125,
                    color: Color(0xff008631),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
