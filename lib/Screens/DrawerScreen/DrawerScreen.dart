import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/Screens/AboutUs.dart';
import 'package:login/Screens/ContactUs.dart';
import 'package:login/Screens/DrawerScreen/HeaderDrawerScreen.dart';
import 'package:login/Screens/DrawerScreen/MyDrawerList.dart';
import 'package:login/Screens/FeedBack.dart';
import 'package:login/Screens/HomeSc.dart';
import 'package:login/Screens/PrivacyPolicie.dart';
import 'package:login/Screens/SearchScreen.dart';
import 'package:login/service/firebase/Auth/FBLogOut.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  var currentPage = DrawerSections.dashboard;

  static void _handleLogout() async {
    await logoutUser();
  }

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = HomeSc();
    } else if (currentPage == DrawerSections.search) {
      container = SearchScreen();
    } else if (currentPage == DrawerSections.aboutus) {
      container = const AboutUs();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactUs();
    } else if (currentPage == DrawerSections.privacy_policy) {
      container = PrivacyPoliceSC();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = FeedBackSC();
    } else if (currentPage == DrawerSections.logout) {
      _handleLogout();
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey[800]),
          backgroundColor: const Color.fromARGB(255, 39, 222, 191),
          title: Image.asset(
            "Assets/img/app_logo.png",
            width: 170,
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MyHeaderDrawer(),
                  MyDrawerList(
                    currentPage: currentPage,
                    onMenuItemSelected: (selectedPage) {
                      Navigator.pop(context);
                      setState(() {
                        currentPage = selectedPage;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: container);
  }
}
