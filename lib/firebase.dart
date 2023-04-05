import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<User?> register(
      String email, String pass, BuildContext context) async {
    try {
      UserCredential usercredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
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

  Future<User?> login(String email, String pass, BuildContext context) async {
    try {
      
      UserCredential usercredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
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

  Future resetPassword(email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Reset password link send"),
        backgroundColor: Colors.green,
      ));
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message.toString()),
        backgroundColor: Colors.red,
      ));
      Navigator.of(context).pop();
    }
  }

  Future upload(String name, String address, String role) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set({"name": name, "address": address, "role": role});
  }

  Future<Map<String, dynamic>?> getUserData(String id) async {
  final DocumentReference documentRef =
      FirebaseFirestore.instance.collection('users').doc(id);

  final DocumentSnapshot documentSnapshot = await documentRef.get();

  if (documentSnapshot.exists) {
    final data = documentSnapshot.data() as Map<String, dynamic>;
    return data;
  } else {
    return null;
  }
}

Future<List<Map<String, dynamic>>> getUserDataListByName(String name) async {
  CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  QuerySnapshot querySnapshot = await usersCollection.where('role', isEqualTo: name).get();
  List<Map<String, dynamic>> userDataList = [];
  for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
    Map<String, dynamic> userData = documentSnapshot.data()as Map<String, dynamic>;
    userDataList.add(userData);
  }
  return userDataList;
}



}
