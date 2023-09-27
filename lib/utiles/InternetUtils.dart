// import 'dart:async';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class InternetService {
//   final _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;

//   void start() {
//     _connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen((result) {
//       if (result == ConnectivityResult.none) {
//         // Internet is turned off, show a notification or message
//         // You can use Fluttertoast or another package to display a message.
//         // Example using Fluttertoast:
//         Fluttertoast.showToast(
//           msg: "Internet is turned off. Please turn it on to use the app.",
//           toastLength: Toast.LENGTH_LONG,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//       }
//     });
//   }

//   void stop() {
//     _connectivitySubscription.cancel();
//   }
// }
