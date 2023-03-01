import 'package:flutter/material.dart';
import 'package:pol/Encrypt.dart';
import 'lolz.dart';
import 'decrypt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>with TickerProviderStateMixin {


  TabController? _controller;
  int selectWidget=0;
  List<Widget>naviWidgets=[];

  void changeWidget(int index){
    setState(() {
      selectWidget=index;
    });
  }

  @override
  void initState() {
    _controller=TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: TabBarView(
        controller: _controller,
        children: [
          Encrypt(),
          Decrypt(),
          lolz()
        ],
      )
      ),
      bottomNavigationBar: Container(
        decoration:
        BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.deepPurple),

        margin: EdgeInsets.all(20),
        child: TabBar(
          controller: _controller,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(icon: Icon(Icons.home),),
            Tab(icon: Icon(Icons.contact_page),),
            Tab(icon: Icon(Icons.add),)
          ],
        ),
      ),
    );
  }
}


