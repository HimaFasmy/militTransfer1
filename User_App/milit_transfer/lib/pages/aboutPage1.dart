// import 'package:flutter/material.dart';
// import 'package:milit_transfer/pages/encode.dart';
// import 'package:milit_transfer/colors/colors.dart';
// import 'package:milit_transfer/font/font.dart';
//
//
// //
// // const font =
// //     TextStyle(fontFamily: 'ErasBod', color: Colors.white, fontSize: 20);
// // const appBarFont = TextStyle(
// //     fontFamily: 'ErasBod',
// //     fontSize: 30.0,
// //     fontWeight: FontWeight.bold,
// //     color: Colors.white);
// //
// // class SelectionPage extends StatefulWidget {
// //   const SelectionPage({Key? key}) : super(key: key);
// //
// //   @override
// //   State<SelectionPage> createState() => _SelectionPageState();
// // }
// //
// // class _SelectionPageState extends State<SelectionPage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color(0xFF23242C),
// //       appBar: AppBar(
// //         title: Text(
// //           'militTransfer',
// //           style: appBarFont,
// //         ),
// //         centerTitle: true,
// //         backgroundColor: Colors.black, //should work with primary color
// //       ),
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           child: Center(
// //             child: Padding(
// //               padding: const EdgeInsets.only(top: 150),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   GestureDetector(
// //                     child: Reusable1(
// //                       text: Text(
// //                         'Encode',
// //                         style: font,
// //                       ),
// //                     ),
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(builder: (context) => encodePage()),
// //                       );
// //                     },
// //                   ),
// //                   //SizedBox(width: 70, height: 40),
// //                   GestureDetector(
// //                     child: Reusable1(
// //                       text: Text(
// //                         'Decode',
// //                         style: font,
// //                       ),
// //                     ),
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(builder: (context) => encodePage()),
// //                       );
// //                     },
// //                   ),
// //                   GestureDetector(
// //                     onTap: () {},
// //                     child: Reusable1(
// //                       text: Text(
// //                         'About',
// //                         style: font,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class Reusable1 extends StatelessWidget {
//   Reusable1({required this.text});
//   final Text text;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 120,
//       height: 120,
//       child: Center(
//         child: text,
//       ),
//       margin: EdgeInsets.all(15.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Color(0xFF49724A),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// //import 'package:flutter_local_auth/screens/home_screen.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:local_auth_android/local_auth_android.dart';
// //import 'package:local_auth_ios/local_auth_ios.dart';
// import 'package:local_auth/error_codes.dart' as auth_error;
// import 'package:milit_transfer/pages/encode.dart';
//
// import '../main.dart';
//
// class LocalAuthScreen extends StatefulWidget {
//   const LocalAuthScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LocalAuthScreen> createState() => _LocalAuthScreenState();
// }
//
// class _LocalAuthScreenState extends State<LocalAuthScreen> {
//   final LocalAuthentication auth = LocalAuthentication();
//   Future<void> authinticate() async {
//     try {
//       final bool didAuthenticate = await auth.authenticate(
//         localizedReason: 'Please authenticate to show account balance',
//         options: const AuthenticationOptions(useErrorDialogs: false),
//       );
//       if (didAuthenticate == true) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => encodePage()));
//       }
//     } on PlatformException catch (e) {
//       if (e.code == auth_error.notEnrolled) {
//         // Add handling of no hardware here.
//       } else if (e.code == auth_error.lockedOut ||
//           e.code == auth_error.permanentlyLockedOut) {
//       } else {
//         // ...
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Wallet App'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'Welcome to wallet app',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//           ),
//           Center(
//             child: ElevatedButton(
//               child: const Text('My Wallet Ballance'),
//               onPressed: () => authinticate(),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//=======================================authentification====================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_local_auth/screens/home_screen.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
//import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:milit_transfer/colors/colors.dart';
import 'package:milit_transfer/pages/encode.dart';

class Authentification extends StatefulWidget {
  const Authentification({Key? key}) : super(key: key);

  @override
  State<Authentification> createState() => _AuthentificationState();

  authenticate({required String localizedReason, required options}) {}
}

class _AuthentificationState extends State<Authentification> {
  final Authentification auth = Authentification();

  Future<void> authenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Authenticate to share image',
        options: const AuthenticationOptions(useErrorDialogs: false),
      );
      if (didAuthenticate == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => encodePage()));
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        //xcvbn
      } else {
        //
      }
    }
  }

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
          child: Column(
            children: [
              const Text(
                'Verify',
                style: TextStyle(fontSize: 22),
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Click here'),
                  onPressed: () => authenticate(),
                  //=> authenticate(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:image/image.dart' as img;
//
// void main() {
//   // Load the image from file
//   final imageFile = File('image.png');
//   final image = img.decodeImage(imageFile.readAsBytesSync());
//
//   // Convert the text to a list of bits
//   final text = 'Hello, world!';
//   final bits = text.codeUnits
//       .expand((unit) => unit.toRadixString(2).padLeft(8, '0').split(''))
//       .map(int.parse)
//       .toList();
//
//   // Make sure the image has enough pixels to store all the bits
//   final pixelsNeeded = (bits.length / 3).ceil();
//   final pixelsAvailable = image.width * image.height;
//   if (pixelsNeeded > pixelsAvailable) {
//     throw Exception('Not enough pixels to store the text');
//   }
//
//   // Store the bits inside the least significant bits of the pixel values
//   var bitIndex = 0;
//   for (var y = 0; y < image.height; y++) {
//     for (var x = 0; x < image.width; x++) {
//       if (bitIndex < bits.length) {
//         final pixel = image.getPixel(x, y);
//         final newPixel = ((pixel & 0xfffffffc) |
//             bits[bitIndex] |
//             (bits[bitIndex + 1] << 1) |
//             (bits[bitIndex + 2] << 2));
//         image.setPixel(x, y, newPixel);
//         bitIndex += 3;
//       } else {
//         break;
//       }
//     }
//     if (bitIndex >= bits.length) {
//       break;
//     }
//   }
//
//   // Save the modified image to file
//   final modifiedImageFile = File('image-modified.png');
//   modifiedImageFile.writeAsBytesSync(img.encodePng(image));
// }
