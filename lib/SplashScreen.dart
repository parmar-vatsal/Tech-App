import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Screens/AuthScreen/LoginScreen.dart';
import 'Screens/DrawerScreen/DrawerScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _userSignedIn = false; // Add a variable to track user sign-in status

  @override
  void initState() {
    super.initState();
    // Check user authentication status
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        // User is signed in
        setState(() {
          _userSignedIn = true;
        });
      } else {
        // User is not signed in
        setState(() {
          _userSignedIn = false;
        });
      }

      // After a delay, navigate to the appropriate screen
      Future.delayed(Duration(seconds: 3), () {
        if (_userSignedIn) {
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          // If user is not signed in, you can navigate to the login screen or any other screen
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 39, 222, 191),
      body: Center(
        child: Image.asset('Assets/img/tech_app_logo.gif',
            width: 300, height: 300),
      ),
    );
  }
}
