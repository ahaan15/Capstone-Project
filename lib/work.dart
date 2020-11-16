import 'package:flutter/material.dart';
import 'package:firstpage/main.dart';
import 'package:firstpage/work2.dart';
import 'package:firstpage/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Work extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          child: Column(
            children: <Widget>[
              Container( //IMAGE
                color: Color.fromRGBO(184, 174, 121,1),
                child: Image(
                  image: AssetImage('images/8.png'),
                  width: 600.0,
                  height: 270,
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              Container( //Package Input
                width: 350,
                height: 70,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/fifth');
                  },
                  child: Text('Package',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  color: Color.fromRGBO(133, 215, 236,1),
                ),
              ),//Name
              SizedBox(
                height: 40.0,
              ),
              Container( //QR Auth
                width: 350,
                height: 70,
                child: RaisedButton(
                  onPressed: () {
                    //_scanBarcode();
                    Navigator.pushNamed(context, '/sixth');
                  },
                  child: Text('QR Authentication',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                  color: Color.fromRGBO(133, 215, 236,1),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 20.0,
              ),

              Container(
                width: 210,
                height: 50,
                margin: EdgeInsets.fromLTRB(200.0, 40.0, 15.0, 3.0),
                child: RaisedButton(
                  onPressed: () {
                    context.read<AuthService>().signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);                  },
                  child: Text('Sign Out', //Sign Out (return to homepage)
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 20),),
                  color: Color.fromRGBO(186, 132, 132, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
