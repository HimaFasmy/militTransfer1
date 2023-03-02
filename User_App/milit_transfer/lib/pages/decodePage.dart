import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:milit_transfer/colors/colors.dart';
import 'package:milit_transfer/font/font.dart';

class decodePage extends StatefulWidget {
  const decodePage({Key? key}) : super(key: key);

  @override
  State<decodePage> createState() => _decodePageState();
}

class _decodePageState extends State<decodePage> {
  static final TextStyle buttonFont1 = TextStyle(
      fontFamily: 'fira code', fontWeight: FontWeight.w700, fontSize: 16);

  //static const platform = MethodChannel('samples.flutter.dev/militTransfer');

  ImagePicker picker = ImagePicker();
  XFile? image;

  // File? _image;
  //
  // Future getImage(ImageSource source) async {
  //   final image = await ImagePicker().pickImage(source: source);
  //   if (image == null) return;
  //   final imageTemporary = File(image.path);
  //
  //   setState(() {
  //     this._image = imageTemporary;
  //   });
  // }

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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  children: [
                    Icon(Icons.menu, color: Colors.white, size: 40.0),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                // child: Container(
                //   width: 500,
                //   height: 200,
                //   // child: Container(
                //   //     // _image != null
                //   //     //     ? Image.file(_image!,width: 250,height: 250,fit: BoxFit.cover);
                //   //     //padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                //   //     //width: 500,
                //   //     //height: 200,
                //   //     //color: Colors.cyan,
                //   //     //alignment: Alignment.topCenter,
                //   //     ),
                //   // child: TextFormField(),
                //   // width: 700,
                //   // height: 200,
                //   // color: Color(0xffaaaaaa),
                // ),
              ),

              image == null
                  ? Container(
                      width: 70,
                      height: 20,
                    )
                  : Image.file(
                      File(image!.path),
                    ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 120.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.buttonColor,
                    foregroundColor: Colors.white,
                    textStyle: buttonFont1,
                  ),
                  onPressed: () async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                    //_getFromGallery();
                    // ImagePicker.platform.getImage(source: ImageSource.gallery);
                    // setState(() {});
                    // Respond to button press
                  },
                  child: Text('select Image'),
                ),
              ),
              // _image != null
              //     ? Image.file(_image!,
              //         width: 250, height: 250, fit: BoxFit.cover)
              //     : Image.network(
              //         'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),

              // CustomButton(
              //   title: 'Add Imagee',
              //   onClick: () => getImage(ImageSource.camera),
              // ),
              //),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
                child: TextFormField(
                  cursorColor: Colors.blue,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Secret Key";
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
                    fillColor: Color(0xff3a4c40),
                    //grey
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
                    fillColor: Color(0xff3a4c40),
                    //grey
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
                    backgroundColor: AppColor.buttonColor,
                    foregroundColor: Colors.white,
                    textStyle: buttonFont1,
                  ),
                  onPressed: () {
                    // _image != null
                    //     ? Image.file(_image!,
                    //         width: 250, height: 250, fit: BoxFit.cover)
                    //     : Image.network(
                    //         'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
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
