import 'package:flutter/material.dart';
import 'package:firstpage/main.dart';
import 'package:firstpage/login.dart';
import 'package:firstpage/auth_service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
     /* initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
       // '/': (context) => MyApp(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => LoginPage(), //
        '/third': (context) => ThirdPage(), //
        '/fourth': (context) => FourthPage(), //
      },*/
     Scaffold(
          backgroundColor: Color.fromRGBO(72, 111, 118, 1),
          //home: AuthenticationWrapper(), //NEW
          body: Container(
            child: Stack(
                children: <Widget>[
                  Container( //Triangle Design
                    width: 500,
                    height: 682,
                    color: Color.fromRGBO(72, 111, 118, 1),//184, 174, 121, 1),
                    child: CustomPaint(painter: FaceOutlinePainter()),
                  ),
                  Positioned( //Package Companion Text
                    top: 350,
                    bottom: 100,
                    left: 100,
                    right: 100,
                    child: Text('Package Companion',
                        style: TextStyle(
                          color: Color.fromRGBO(179, 161, 145, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          decoration: TextDecoration.underline,),

                        textAlign: TextAlign.center),
                  ),
                  Positioned( // BU Image
                    top: 10,
                    bottom: 400,
                    left: 100,
                    child: Image.asset(
                        'images/2.png',
                        height: 10,
                        width: 200,
                        fit: BoxFit.fitWidth),
                  ),
                  Positioned(
                    top: 470,
                    bottom: 150,
                    left: 100,
                    right: 100,
                    child: Container( //login
                      width: 350,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/second');
                        },
                        child: Text('Login',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        color: Color.fromRGBO(133, 215, 236,1),
                      ),
                    ),
                  ),//Email
                  Positioned(
                    top: 570,
                    bottom: 50,
                    left: 100,
                    right: 100,
                    child: Container( //Email
                      width: 350,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/third');
                        },
                        child: Text('Sign Up',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        color: Color.fromRGBO(133, 215, 236,1),
                      ),
                    ),
                  ),//Email
                ]
            ),
          ),
        );


  }
}

class FaceOutlinePainter extends CustomPainter { //for homepage design
  @override
  void paint(Canvas canvas, Size size) {
    // Define a paint object
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0
      ..color = Color.fromRGBO(184, 174, 121, 1);

    // create a path
    var path = Path();
    //path.lineTo(0, size.height); (size.width / 2, size.height / 2);
    path.lineTo(0, 250);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(size.width,250);
    path.lineTo(size.width,0);
    path.lineTo(0,0);

    canvas.drawPath(path, paint);
    path.close();
  }
  @override
  bool shouldRepaint(FaceOutlinePainter oldDelegate) => false;
}


class Forgot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          child: Column(
            children: <Widget>[
              Container( //IMAGE
                color: Color.fromRGBO(57, 186, 168, 1),
                child: Image(
                  image: AssetImage('images/4.png'),
                  width: 500.0,
                  height: 270,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container( //Email
                width: 350,
                height: 70,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Email ID',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  color: Color.fromRGBO(133, 215, 236,1),
                ),
              ),//Email
              SizedBox(
                height: 40.0,
              ),
              Container( //OTP
                width: 350,
                height: 70,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Enter OTP',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  color: Color.fromRGBO(133, 215, 236,1),
                ),
              ),//Password
              SizedBox(
                height: 10.0,
              ),
              Container( //Resend OTP
                //width: 210,
                height: 30,
                margin: EdgeInsets.fromLTRB(270.0, 5.0, 15.0, 1.0),
                child: Text('Resend OTP?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20),),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container( // New Password
                width: 350,
                height: 70,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('New Password',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  color: Color.fromRGBO(133, 215, 236,1),
                ),
              ),//New Password

            ],
          ),
        ),
      ),
    );
  }
}