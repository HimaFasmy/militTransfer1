import 'package:flutter/material.dart';
import 'package:milit_transfer/pages/encode.dart';
import 'package:milit_transfer/pages/aboutPage.dart';
import 'package:milit_transfer/colors/colors.dart';
import 'package:milit_transfer/font/font.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  static final TextStyle font =
      TextStyle(fontFamily: 'ErasBod', fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backroundColor,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Reusable1(
                      text: Text(
                        'Encode',
                        style: font,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => encodePage()),
                      );
                    },
                  ),
                  //SizedBox(width: 70, height: 40),
                  GestureDetector(
                    child: Reusable1(
                      text: Text(
                        'Decode',
                        style: font,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => encodePage()),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                      );
                    },
                    child: Reusable1(
                      text: Text(
                        'About',
                        style: font,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Reusable1 extends StatelessWidget {
  Reusable1({required this.text});
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      child: Center(
        child: text,
      ),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF49724A),
      ),
    );
  }
}
