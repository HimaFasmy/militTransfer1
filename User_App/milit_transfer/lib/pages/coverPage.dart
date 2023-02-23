import 'package:flutter/material.dart';
import 'package:milit_transfer/pages/selectionPage.dart';
import 'package:milit_transfer/pages/loginPage.dart';

void main() {
  runApp(const MaterialApp(
    // theme: ThemeData.dark().primaryColor.,
    title: 'navigation',
    home: CoverPage(),
  ));
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
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "militTransfer",
            style: TextStyle(
              fontFamily: 'ErasBod',
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 70.0),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Image(
              image: AssetImage('images/logo.png'),
              height: 250.0,
              width: 400.0,
            ),
          )
        ],
      ),
    );
  }
}
