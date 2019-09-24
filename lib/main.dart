import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:testone/intro.dart';
import 'wierd_alert_dialog.dart' show UnicornAlertDialog;
import 'package:pin_view/pin_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: Intro(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              'Get Started',
              style: TextStyle(fontSize: 25.0),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Text(
              'Please login or sign up to continue using our app.',
              style: TextStyle(fontSize: 14.0, color: Colors.black26),
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              alignment: Alignment.topLeft,
              child: Text(
                'Mobile number',
                style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 5, 30, 20),
              child: TextFormField(
                decoration: new InputDecoration(
                  counterText: "",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
                keyboardType: TextInputType.phone,
                maxLength: 10,
              ),
            ),
            const SizedBox(height: 30.0),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0xDD4a00e0),
                      Color(0xFF8e2de2),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: const Text('Get OTP', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(70),
            ),
            Text(
              'Enter via social networks',
              style: TextStyle(fontSize: 14.0, color: Colors.black26),
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
                  width: 125.0,
                  height: 50.0,
                  child: SignInButton(
                    Buttons.Google,
                    mini: true,
                    onPressed: () {},
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                    width: 125.0,
                    height: 50.0,
                    child: SignInButton(
                      Buttons.Facebook,
                      mini: true,
                      onPressed: () {},
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondRoute()));
                  },
                  child: Text(
                    'Skip Login ?',
                    style: TextStyle(fontSize: 13.0, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(
                'Enter OTP',
                style: TextStyle(fontSize: 25.0),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Text(
                'We have sent a one time verification code to your',
                style: TextStyle(fontSize: 14.0, color: Colors.black26),
              ),
              Text(
                ' registered mobile ',
                style: TextStyle(fontSize: 14.0, color: Colors.black26),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child: PinView(
                    count: 4,
                    margin: EdgeInsets.all(10), // margin between the fields
                    obscureText:
                        true, // describes whether the text fields should be obscure or not, defaults to false
                    style: TextStyle(
                        // style for the fields
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    dashStyle: TextStyle(
                      // dash style
                      fontSize: 20.0,
                    ),
                    //color: Colors.indigoAccent),
                    submit: (String pin) {
                      // when all the fields are filled
                      // submit function runs with the pin
                      print(pin);
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Dont recieve the OTP?',
                      style: TextStyle(fontSize: 14.0, color: Colors.black38),
                    ),
                  ),
                  Container(
                    child: Text(
                      ' RESEND OTP',
                      style: TextStyle(fontSize: 14.0, color: Colors.indigo),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                onPressed: () => _showDialog(context),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(0xDD4a00e0),
                        Color(0xFF8e2de2),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: const Text('Verify', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(70),
              ),
              Text(
                'Enter via social networks',
                style: TextStyle(fontSize: 14.0, color: Colors.black26),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 5, 0),
                    width: 125.0,
                    height: 50.0,
                    child: SignInButton(
                      Buttons.Google,
                      mini: true,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                      width: 125.0,
                      height: 50.0,
                      child: SignInButton(
                        Buttons.Facebook,
                        mini: true,
                        onPressed: () {},
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              new GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstRoute()));
                },
                child: Text(
                  ' ',
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return GestureDetector(
            child: UnicornAlertDialog(
                title: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset('images/done.png'),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      child: Text(
                        'Verify',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    )
                  ],
                ),
                content: Text(
                    'You have successfully verified your mobile number',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15.0)),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xDD4a00e0),
                    Color(0xFF8e2de2),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                actions: <Widget>[]),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThirdRoute()));
            },
          );
        });
  }
}

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(0),
            ),
            Text(
              'Personal details',
              style: TextStyle(fontSize: 25.0),
            ),
            const SizedBox(height: 30.0),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              alignment: Alignment.topLeft,
              child: Text(
                'Name',
                style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 5, 30, 20),
              child: TextFormField(
                decoration: new InputDecoration(
                  counterText: "",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
                keyboardType: TextInputType.text,
                maxLength: 10,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              alignment: Alignment.topLeft,
              child: Text(
                'DOB',
                style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 5, 30, 20),
              child: TextFormField(
                decoration: new InputDecoration(
                  counterText: "",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
              alignment: Alignment.topLeft,
              child: Text(
                'Email',
                style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 5, 30, 20),
              child: TextFormField(
                decoration: new InputDecoration(
                  counterText: "",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 40.0),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0xDD4a00e0),
                      Color(0xFF8e2de2),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: const Text('Proceed', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        )));
  }
}
