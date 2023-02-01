import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

Future<User?> register(String email,String pass, BuildContext context) async {
    try {
       UserCredential usercredential=await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: pass,);
          return usercredential.user;
        
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
  
  }

  Future<User?> login(String email,String pass, BuildContext context) async {
    try {
       UserCredential usercredential=await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: pass,);
          return usercredential.user;
        
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (e) {
      print(e);
    }
  
  }

  Future<AuthCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
        return authCredential;
        
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  googleSignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }


}

