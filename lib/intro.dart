import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:testone/main.dart';

class Intro extends StatefulWidget {
  Intro({Key key}) : super(key: key);

  @override
  IntroState createState() => new IntroState();
}

class IntroState extends State<Intro> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Comparison with best deals",
        styleTitle:
        TextStyle(color: Colors.black, fontSize: 23.0, fontWeight: FontWeight.bold, fontFamily: 'Ubuntu'),
        description:
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
        styleDescription:
        TextStyle(color: Colors.black38, fontSize: 17.0, fontFamily: 'Ubuntu'),
        pathImage: "images/intro1.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Comparison with best deals",
        styleTitle:
        TextStyle(color: Colors.black, fontSize: 23.0, fontWeight: FontWeight.bold, fontFamily: 'Ubuntu'),
        description: "Ye indulgence unreserved connection alteration appearance",
        styleDescription:
        TextStyle(color: Colors.black38, fontSize: 17.0, fontFamily: 'Ubuntu'),
        pathImage: "images/intro2.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Comparison with best deals",
        styleTitle:
        TextStyle(color: Colors.black, fontSize: 23.0, fontWeight: FontWeight.bold, fontFamily: 'Ubuntu'),
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription:
        TextStyle(color: Colors.black38, fontSize: 17.0, fontFamily: 'Ubuntu'),
        pathImage: "images/intro3.png",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstRoute()));
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }
  void onSkipPress(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstRoute()));
    
  }
  Widget renderNextBtn() {
    return Text(
      'Next',
      style: TextStyle(fontSize: 15.0, color: Colors.black),
    );
  }

  Widget renderDoneBtn() {
    return Text(
      'Done',
      style: TextStyle(fontSize: 15.0, color: Colors.black),
    );
  }

  Widget renderSkipBtn() {
    return Text(
      'Skip',
      style: TextStyle(fontSize: 15.0, color: Colors.black),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 160.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                    currentSlide.pathImage,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
      colorSkipBtn: Colors.white,
      highlightColorSkipBtn: Colors.blue,

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Colors.white,
      highlightColorDoneBtn: Colors.blue,

      // Dot indicator
      colorDot: Colors.black12,
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}