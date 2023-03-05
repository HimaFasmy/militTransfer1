import 'package:flutter/material.dart';
import 'package:milit_transfer/pages/selectionPage.dart';
import 'package:milit_transfer/pages/decodePage.dart';
import 'package:milit_transfer/pages/aboutPage.dart';

import '../colors/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  TabController? _controller;
  int selectWidget = 0;
  List<Widget> naviWidgets = [];

  void changeWidget(int index) {
    setState(() {
      selectWidget = index;
    });
  }

  @override
  void initState() {
    _controller = TabController(
        length: 3,
        vsync: this,
        animationDuration: Duration.zero,
        initialIndex: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backroundColor,
      body: SafeArea(
          child: TabBarView(
        physics: BouncingScrollPhysics(),
        controller: _controller,
        children: [SelectionPage(), decodePage(), AboutPage()],
      )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: AppColor.buttonColor),
        margin: EdgeInsets.all(20),
        child: TabBar(
          controller: _controller,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(icon: Icon(Icons.home, size: 30)),
            Tab(icon: Icon(Icons.add, size: 30)),
            Tab(icon: Icon(Icons.account_box, size: 30)),
          ],
        ),
      ),
    );
  }
}
