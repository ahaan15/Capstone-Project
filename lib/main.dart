//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstpage/auth_service.dart';
import 'package:firstpage/homepage.dart';
import 'package:firstpage/login.dart';
import 'package:firstpage/work.dart';
import 'package:firstpage/work1.dart';
import 'package:firstpage/work2.dart';
import 'package:firstpage/register.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
/*
void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => MyApp(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => SecondPage(),
      '/third': (context) => ThirdPage(),
      '/fourth': (context) => FourthPage(),
    },
  ));
}*/

//Firebase setup

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        Provider<AuthService>(
        create: (_) => AuthService(FirebaseAuth.instance),
          //builder: (_) => FirebaseAuth.instance,
          ),

        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
            //builder: (context) {return context.read<AuthService>().authStateChanges}
          )
       ],
        child: MaterialApp(

              initialRoute: '/',
              routes: {
                // When navigating to the "/" route, build the FirstScreen widget.
               // '/': (context) => MyApp(),
                '/home': (context) => HomePage(),
                // When navigating to the "/second" route, build the SecondScreen widget.
                '/second': (context) => LoginPage(), //
                '/third': (context) => Register(), //
                '/fourth': (context) => Work(), //
                '/fifth': (context) => Work1(),
                '/sixth': (context) => Work2(),
              },

          home: AuthenticationWrapper(),

        ),
      );

  }
}


class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null){
      return Work();
    }
      return HomePage();
    }
}
