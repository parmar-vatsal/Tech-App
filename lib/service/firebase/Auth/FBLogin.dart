import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../Screens/DrawerScreen/DrawerScreen.dart';

class FBLogin {
  static Future<bool> FbLogin({
    required BuildContext context,
    required String emailController,
    required String passController,
  }) async {
    try {
      var userData = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController,
        password: passController,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully Login 👍 '),
          duration: Duration(seconds: 3),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePageScreen()),
      );

      print("userdata == $userData");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User Not Exist.'),
            duration: Duration(seconds: 2),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong Password'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
