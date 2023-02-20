import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class decodePage extends StatefulWidget {
  const decodePage({Key? key}) : super(key: key);

  @override
  State<decodePage> createState() => _decodePageState();
}

class _decodePageState extends State<decodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  children: [
                    Icon(Icons.menu, color: Colors.white, size: 40.0),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 45),
                child: Container(
                  child: TextFormField(),
                  width: 700,
                  height: 200,
                  color: Color(0xffaaaaaa),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 140.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff008631),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                        fontFamily: 'fira code',
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    // ImagePicker.platform.getImage(source: ImageSource.gallery);
                    // setState(() {});
                    // Respond to button press
                  },
                  child: Text('Add Image'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                child: TextFormField(
                  cursorColor: Colors.blue,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Secret Key";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // _email = value;
                  },
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.greenAccent),
                      //borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.amberAccent),
                    ),
                    filled: true,
                    fillColor: Color(0xff3a4c40), //grey
                    labelText: 'Secret Key',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Color(0xff2bc20e),
                      fontFamily: 'fira code',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
                child: TextFormField(
                  cursorColor: Colors.blue,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter Message";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // _email = value;
                  },
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.greenAccent),
                      //borderRadius: BorderRadius.circular(50.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.amberAccent),
                    ),
                    filled: true,
                    fillColor: Color(0xff3a4c40), //grey
                    labelText: 'Message',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Color(0xff2bc20e),
                      fontFamily: 'fira code',
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 140.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff008631),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                        fontFamily: 'fira code',
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  onPressed: () {
                    // ImagePicker.platform.getImage(source: ImageSource.gallery);
                    // setState(() {});
                    // Respond to button press
                  },
                  child: Text('Decrypt'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
