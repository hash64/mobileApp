import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testone/deals.dart';
import 'package:testone/intro.dart';
import 'package:testone/profile.dart';

void main() => runApp(test1());

class test1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  int _currentIndex = 0;

  List<Widget> _tabList = [
    Container(
      child:
      Intro(),
      
    ),
    Container(
      child: Intro(),
      // color: Colors.red,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(child: Profile(),)

  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toUpperCase()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (currentIndex){

          setState(() {
            _currentIndex = currentIndex;
          });

            _tabController.animateTo(_currentIndex);

        },
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
            
            // activeIcon: Intro(),
          ),
          BottomNavigationBarItem(
            title: Text("Deals"),
            icon: Icon(Icons.business_center),
            // activeIcon: Profile(),
          ),
          BottomNavigationBarItem(
            title: Text("Favourites"),
            icon: Icon(Icons.favorite_border),
            // activeIcon: Deals(),
          ),
          BottomNavigationBarItem(
            title: Text("Profile"),
            icon: Icon(Icons.portrait),
          )
        ],
      ),
    );
  }
}