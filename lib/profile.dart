import 'package:flutter/material.dart';
import 'layout_type.dart';
import 'main_app_bar.dart';

class Profile extends StatelessWidget implements HasLayoutGroup {
  Profile({Key key, this.layoutGroup, this.onLayoutToggle}) : super(key: key);
  final LayoutGroup layoutGroup;
  final VoidCallback onLayoutToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 140,
              decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0xDD4a00e0),
                      Color(0xFF8e2de2),
                    ],
                  ),
                  borderRadius: new BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
            ),
            
            Container(
              margin: EdgeInsets.fromLTRB(30,20,0,10),
              child: Text('Information Account',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
            )
          ],
        ),
      ),
    );
  }
}
