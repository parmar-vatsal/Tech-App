import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Screens/DrawerScreen/DrawerScreen.dart';

class FBSignUp {
  
  static String userName = '';
  static Future<bool> signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    userName = name;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.toString().trim(),
        password: password.toString().trim(),
      );

      CollectionReference userCollection =
          FirebaseFirestore.instance.collection("users");

      await userCollection.add({
        "email": email,
        "passWord": password,
        "name": name,
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePageScreen()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User Created Successfully 👍 '),
          duration: Duration(seconds: 3),
        ),
      );

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('This Email Address is in Use.'),
            duration: Duration(seconds: 3),
          ),
        );
      } else if (e.code == "weak-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please Make a Strong Password'),
            duration: Duration(seconds: 3),
          ),
        );
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
