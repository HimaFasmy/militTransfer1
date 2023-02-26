import 'package:flutter/material.dart';
//import 'package:milit_transfer/pages/decode.dart';
// import 'package:milit_transfer/pages/encode.dart';

// void main() {
//   runApp(const MaterialApp(
//     title: 'navigation',
//     home: SelectionPage(),
//   ));
// }

class SelectionPage extends StatefulWidget {
  //const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.black54, //should work with primary color
      ),
      backgroundColor: Color(0xFF0A0E21),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 200, horizontal: 100),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const encodePage()),
                      // );
                    },
                    child: Text(
                      'Encode Image',
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff008631),
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(
                            fontFamily: 'fira code',
                            fontWeight: FontWeight.w700,
                            fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 100, horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const decodePage()),
                        // );
                      },
                      child: Text(
                        'Decode Image',
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff008631),
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                              fontFamily: 'fira code',
                              fontWeight: FontWeight.w700,
                              fontSize: 20)),
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
