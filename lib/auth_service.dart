import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstpage/login.dart';
import 'package:flutter/cupertino.dart';
//import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Successfully Signed In";
    } on FirebaseAuthException catch (e) {
        return e.message;
    }
  }
  Future<String> signUp({String email, String password}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Successfully Signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

}
