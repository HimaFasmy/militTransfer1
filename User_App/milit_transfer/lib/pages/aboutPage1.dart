import 'package:flutter/material.dart';
import 'package:milit_transfer/pages/encode.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF23242C),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    child: Reusable1(text: Text('Encode')),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => encodePage()),
                      );
                    },
                  ),
                  Reusable1(
                    text: Text('Decode'),
                  ),
                ],
              ),
              Row(
                children: [
                  Reusable1(
                    text: Text('About'),
                  ),
                  Reusable1(
                    text: Text('Other'),
                  ),
                ],
              )
            ],
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
      child: Center(child: text),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
    );
  }
}
