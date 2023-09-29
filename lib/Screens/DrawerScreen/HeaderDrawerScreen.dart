import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  String? user_name;
  String? user_email;
  String? user_img;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Retrieve the user's display name from Firestore
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      final displayName = userData.data()?['name'] ?? user.displayName;

      setState(() {
        user_name = displayName ?? "User Name";
        user_email = user.email ?? "user@example.com";
        user_img = user.photoURL ??
            "https://example.com/default-profile-image.png";
      });
    }
  }

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
                image: NetworkImage(user_img ?? ""),
              ),
            ),
          ),
          Text(
            user_name ?? "User Name",
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontFamily: "Poppins-Medium"),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            user_email ?? "user@example.com",
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
