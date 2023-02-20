import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class encodePage extends StatefulWidget {
  const encodePage({Key? key}) : super(key: key);

  @override
  State<encodePage> createState() => _encodePageState();
}

class _encodePageState extends State<encodePage> {
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
                  onPressed: () async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                    //_getFromGallery();
                    // ImagePicker.platform.getImage(source: ImageSource.gallery);
                    // setState(() {});
                    // Respond to button press
                  },
                  child: Text('Add Image'),
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
                    // _image != null
                    //     ? Image.file(_image!,
                    //         width: 250, height: 250, fit: BoxFit.cover)
                    //     : Image.network(
                    //         'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg');
                    // ImagePicker.platform.getImage(source: ImageSource.gallery);
                    // setState(() {});
                    // Respond to button press
                  },
                  child: Text('Encrypt'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget CustomButton({
  //   required String title,
  //   required VoidCallback onClick,
  // }) {
  //   return Container(
  //     width: 200,
  //     child: ElevatedButton(
  //       onPressed: () => {},
  //       child: Text("h"),
  //     ),
  //   );
  // }

  //get imag from gallery

  // _getFromGallery() async {
  //   PickedFile pickedFile =
  //       await ImagePicker().getImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }
  // //get from gallery
  // _getFromGallery() async {
  //   PickedFile pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     File imageFile = File(pickedFile.path);
  //   }
  // }
}
