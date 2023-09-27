import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  var user_name = FirebaseAuth.instance.currentUser?.displayName;
  var user_email = FirebaseAuth.instance.currentUser?.email;
  var user_img = FirebaseAuth.instance.currentUser?.photoURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(39, 222, 191, 1),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage("$user_img"),
              ),
            ),
          ),
          Text(
            "$user_name",
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontFamily: "Poppins-Medium"),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            "$user_email",
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 14,
                fontFamily: "Poppins-Regular"),
          ),
        ],
      ),
    );
  }
}
