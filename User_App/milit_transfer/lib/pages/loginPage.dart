import 'package:flutter/material.dart';

// void main() {
//   runApp(const MaterialApp(
//     title: 'navigation',
//   ));
// }

class LoginPage extends StatefulWidget {
  //const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 80.0, horizontal: 120.0),
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      width: 150,
                      height: 80,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Login to manage your account',
                  style: TextStyle(
                    fontFamily: 'fira code',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Form(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      //padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      //color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: TextFormField(
                          cursorColor: Colors.blue,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Username";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _email = value;
                          },
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.greenAccent),
                              //borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.amberAccent),
                            ),
                            filled: true,
                            fillColor: Color(0xff3a4c40), //grey
                            labelText: 'Username',
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
                      height: 100,
                      //padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      //color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: TextFormField(
                          cursorColor: Colors.blue,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Password";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _password = value;
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.greenAccent),
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
                    //Padding(padding: const EdgeInsets.all(10.0), child: loginBtn),
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
                            // Respond to button press
                          },
                          child: Text('Login'),
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
