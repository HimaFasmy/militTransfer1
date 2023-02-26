import 'package:flutter/material.dart';
//import 'package:milit_transfer/pages/selectionPage.dart';
import 'package:milit_transfer/pages/loginPage.dart';
import 'package:milit_transfer/pages/aboutPage1.dart';

void main() {
  runApp(
    const MaterialApp(
      // theme: ThemeData.dark().primaryColor.,
      title: 'navigation',
      home: CoverPage(),
    ),
  );
}

class CoverPage extends StatefulWidget {
  const CoverPage({Key? key}) : super(key: key);

  @override
  State<CoverPage> createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF23242C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "militTransfer",
            //   style: TextStyle(
            //     fontFamily: 'ErasBod',
            //     fontSize: 32.0,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.white,
            //   ),
            // ),
            // SizedBox(height: 70.0),
            Container(
              width: 700,
              height: 864,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectionPage()),
                  );
                },
                child: Image(
                  image: AssetImage('images/logo.png'),
                  height: 300.0,
                  width: 300.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
