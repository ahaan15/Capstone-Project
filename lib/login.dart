import 'package:firstpage/main.dart';
import 'package:firstpage/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class LoginPage extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Container(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 7,
                child: Container( //IMAGE
                  color: Color.fromRGBO(57, 186, 168, 1),
                  child: Image(
                    image: AssetImage('images/1.jpeg'),
                    width: 500.0,
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Flexible(
                flex: 2,
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
                          borderSide: BorderSide(color: Color.fromRGBO(133, 215, 236,1), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink, width: 2.0)
                        )
                    ),
                ),//Email
                ),
              ),

              SizedBox(
                height: 20.0,
              ),
              Flexible(
                flex: 2,
                child: Container( //Password
                  width: 350,
                  height: 50,

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
                  ),
                ),
              ),//Password

              Container( //Sign in Button
                width: 210,
                height: 50,
                margin: EdgeInsets.fromLTRB(200.0, 40.0, 15.0, 3.0),
                child: RaisedButton(
                  onPressed: () {
                   // Navigator.pushNamed(context, '/fourth'); //CHANGED TEMPORARY
                    context.read<AuthService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
                    FocusScope.of(context).unfocus(); //remove keyboard
                    sleep(const Duration(seconds:3));
                    Navigator.pop(context);
                    emailController.clear();
                    passwordController.clear();
                  },
                  child: Text('Sign In', //'Forgot Password?'
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 20),),
                  color: Color.fromRGBO(186, 132, 132, 1),
                ),
              ),
            ],
          ),
        ),
      );
      //home: Firstpage();

  }
}
