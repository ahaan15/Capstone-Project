import 'package:flutter/material.dart';
import 'package:firstpage/main.dart';
import 'package:firstpage/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class Register extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color.fromRGBO(72, 111, 118, 1),
            body: Container(
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 7,
                      child: Container( //IMAGE
                        color: Color.fromRGBO(184, 174, 121,1),
                        child: Image.asset(
                          'images/3.png',
                          height: 310,
                          width: 500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70.0,
                    ),

                    Flexible(
                      flex: 2,
                      child: Container( //Email
                        width: 350,
                        height: 60,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            fillColor: Color.fromRGBO(133, 215, 236,1),
                            filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromRGBO(133, 215, 236,1), width: 2.0),
                              ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink, width: 2.0)
                            )
                          ),
                        )
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),

                    Flexible(
                      flex: 2,
                      child: Container( //Password
                          width: 350,
                          height: 60,
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          autofillHints: null,
                          enableInteractiveSelection: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: "Password",
                            fillColor: Color.fromRGBO(133, 215, 236,1),
                            filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(133, 215, 236,1), width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pink, width: 2.0)
                              )
                          ),
                        )
                      ),
                    ),

                    SizedBox(
                      height: 10.0,
                    ),
                    Flexible(
                      flex: 2,
                      child: Container( //Password
                        width: 350,
                        height: 60,
                        margin: EdgeInsets.fromLTRB(200.0, 40.0, 15.0, 3.0),
                        child: RaisedButton(
                          onPressed: () {
                            context.read<AuthService>().signUp(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            sleep(const Duration(seconds:2));
                            Navigator.pop(context);
                          },
                          child: Text('Sign Up', //'Forgot Password?'
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 20),),
                          color: Color.fromRGBO(186, 132, 132, 1),
                        ),
                      ),
                    ),//Password
                  ],
                )
            )
        )
    );
  }
}
