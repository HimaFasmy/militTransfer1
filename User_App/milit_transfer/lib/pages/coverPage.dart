import 'package:flutter/material.dart';
import 'package:milit_transfer/pages/loginPage.dart';
import 'package:milit_transfer/colors/colors.dart';
import 'package:milit_transfer/font/font.dart';
import 'package:milit_transfer/pages/signupPage.dart';

void main() {
  runApp(
    const MaterialApp(
      // theme: ThemeData.dark().primaryColor.,
      title: 'navigation',
      debugShowCheckedModeBanner: false,
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
      backgroundColor: AppColor.backroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 700,
              height: 864,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
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
