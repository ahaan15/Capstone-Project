import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firstpage/main.dart';
import 'package:firstpage/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_flutter/qr_flutter.dart';
import "package:http/http.dart" as http;


import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Work1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Work1State();
}
class Work1State extends State<Work1> {


//class Work1 extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController enrollmentController = TextEditingController();
  final TextEditingController packageController = TextEditingController();
  String qrData;
  String imageUrl;


  sendMail() async {
    String username = '<ENTER GMAIL USERNAME>';
    String password = '<ENTER GMAIL PASSWORD>';

    final smtpServer = gmail(username, password);

    // Create our message.
    final message = Message()
      ..from = Address(username, 'Package Manager')
      ..recipients.add(emailController.text)
      ..subject = 'Package QR Code'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1></h1>\n<p>Dear, Student\n Please click on the link below to access your QR Code to receive your package :)</p> <p>https://quickchart.io/qr?text=$qrData</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      Fluttertoast.showToast(
          msg: "Mail sent!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
      );
    } on MailerException catch (e) {
      print('Message not sent.');
      Fluttertoast.showToast(
        msg: "Mail could not be sent!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
      );
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }


  createAlertDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text("Success!",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
        content: Image(
        image: AssetImage('images/6.png'),
        width: 50,
        height: 50,
      ),
    );
  });
  }


  createQrCode(qrData) async{

    var uri = (Uri.parse("https://quickchart.io/qr?text="));//https://qrickit-qr-code-qreator.p.rapidapi.com/api/qrickit.php?
    var response = await http.get(uri.replace(queryParameters:<String,String>{
    "text": qrData,
    "size":"500"
    }),
    );
    setState(() {
      //print((response.body));
      print(response.body);
      print(Image(image: NetworkImage("https://quickchart.io/qr?text=$qrData")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 9,
                child: Container( //IMAGE
                  color: Color.fromRGBO(184, 174, 121,1),
                  child: Image(
                    image: AssetImage('images/5.png'),
                    width: 500.0,
                    height: 300,
                  ),
                ),
              ),
              SizedBox(
                height: 70.0,
              ),
              Flexible(
                flex: 3,
                child: Container( //Name
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: "Name",
                        fillColor: Color.fromRGBO(133, 215, 236,1),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(133, 215, 236,1), width: 4.0),

                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink, width: 2.0)
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Flexible(
                flex: 3,
                child: Container( //Email
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        fillColor: Color.fromRGBO(133, 215, 236,1),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(133, 215, 236,1), width: 4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink, width: 2.0)
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Flexible(
                flex: 3,
                child: Container( //Enrollment no.
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: enrollmentController,
                    decoration: InputDecoration(
                        hintText: "Enrollment No.",
                        fillColor: Color.fromRGBO(133, 215, 236,1),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(133, 215, 236,1), width: 4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink, width: 2.0)
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),

              Flexible(
                flex: 3,
                child: Container( //Package No.
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: packageController,keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Package No.",
                        fillColor: Color.fromRGBO(133, 215, 236,1),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(133, 215, 236,1), width: 4.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink, width: 2.0)
                        )
                    ),
                  ),//Email
                ),
              ),
              Container(
                width: 210,
                height: 50,
                margin: EdgeInsets.fromLTRB(200.0, 40.0, 15.0, 3.0),
                child: RaisedButton(
                  onPressed: () async {
                  await db.collection('DATA').add(
                      {
                        'Name':nameController.text.trim(),
                        'Email':emailController.text.trim(),
                        'Enrollment No.':enrollmentController.text.trim(),
                        'Package No.':int.parse(packageController.text),

                      });
                   //TO STORE DATA IN CLOUD UNCOMMENT
                   createAlertDialog(context);
                  FocusScope.of(context).unfocus(); //remove keyboard
                  packageController.toString();
                  //setState(() {
                    qrData = nameController.text == ""
                        ? null
                        : nameController.text.replaceAll(RegExp(' +'),'+')+"-"+enrollmentController.text+"-"+packageController.text;
                  //}); //^ to make it url compatible

                  createQrCode(qrData); //convert text to url acceptable string
                  sendMail();

                  nameController.clear();
                  emailController.clear();
                  enrollmentController.clear();
                  packageController.clear();

                  },

                  child: Text('Enter', //Send data to cloud
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
