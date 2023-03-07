import 'package:flutter/material.dart';
import 'package:pol/Encrypt.dart';
import 'lolz.dart';
import 'decrypt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: 'navbar',
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
    _controller=TabController(
        length: 3,
        vsync: this,
        animationDuration: Duration.zero,
        initialIndex: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: TabBarView(
            physics: BouncingScrollPhysics(),
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
            color: Colors.pink),

        margin: EdgeInsets.all(20),
        child: TabBar(

          controller: _controller,
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.transparent,

          tabs: [
            Tab(icon: Icon(Icons.home,size:30)),
            Tab(icon: Icon(Icons.add,size:30)),
            Tab(icon: Icon(Icons.account_box,size:30)),
          ],
        ),
      ),
    );
  }
}


