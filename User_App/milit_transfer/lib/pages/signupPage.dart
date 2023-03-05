import 'package:flutter/material.dart';
//import 'package:milit_transfer/pages/aboutPage.dart';
import 'package:milit_transfer/pages/selectionPage.dart';
import 'package:milit_transfer/colors/colors.dart';
import 'package:milit_transfer/font/font.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                padding: const EdgeInsets.only(top: 70.0),
                child: Text(
                  'Sign Up to manage your account',
                  style: TextStyle(
                    fontFamily: 'fira code',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.buttonTextColor,
                  ),
                ),
              ),
              Form(
                child: Column(
                  children: [
                    Container(
                      height: 90,
                      //padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      //color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: AppColor.cursorColor,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFF5FE6A3),
                              ),
                              //borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.amberAccent),
                            ),
                            filled: true,
                            fillColor: Color(0xff3a4c40), //grey
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xff2bc20e),
                              fontFamily: 'fira code',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      //padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      //color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: AppColor.cursorColor,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFF5FE6A3),
                              ),
                              //borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.amberAccent),
                            ),
                            filled: true,
                            fillColor: Color(0xff3a4c40), //grey
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xff2bc20e),
                              fontFamily: 'fira code',
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Padding(padding: const EdgeInsets.all(10.0), child: loginBtn),
                    Container(
                      height: 90,
                      //padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      //color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: AppColor.cursorColor,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFF5FE6A3),
                              ),
                              //borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.amberAccent),
                            ),
                            filled: true,
                            fillColor: Color(0xff3a4c40), //grey
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xff2bc20e),
                              fontFamily: 'fira code',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      //padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      //color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: TextFormField(
                          cursorColor: AppColor.cursorColor,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFF5FE6A3),
                              ),
                              //borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.amberAccent),
                            ),
                            filled: true,
                            fillColor: Color(0xff3a4c40), //grey
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xff2bc20e),
                              fontFamily: 'fira code',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      //padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      //color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: AppColor.cursorColor,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFF5FE6A3),
                              ),
                              //borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.amberAccent),
                            ),
                            filled: true,
                            fillColor: Color(0xff3a4c40), //grey
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xff2bc20e),
                              fontFamily: 'fira code',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 60, horizontal: 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff008631),
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(
                                fontFamily: 'fira code',
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          //clipBehavior: Color.alphaBlend(Colors.black, Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectionPage()),
                            );
                          },
                          child: Text(
                            'Sign Up',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
