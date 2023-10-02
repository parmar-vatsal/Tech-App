import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/service/firebase/Auth/FBSignUp.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart'; // Import the overlay_loader_with_app_icon package
import 'package:login/Screens/AuthScreen/SignUpScreen.dart';
import 'package:login/Screens/DrawerScreen/DrawerScreen.dart';
import 'package:login/service/firebase/Auth/FBLogin.dart';
import 'package:login/utiles/UserAuthUtils.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false; // Add this variable

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    var userName = FBSignUp.userName;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: OverlayLoaderWithAppIcon(
          isLoading: isLoading,
          appIcon: Image.asset('Assets/img/Hourglass_loader.gif'),
          appIconSize: 90,
          overlayBackgroundColor: Colors.white,
          circularProgressColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset("Assets/img/Forget_password_img.png",
                        width: 260),
                    const SizedBox(height: 10),
                    const Text(
                      "Forget Password",
                      style: TextStyle(
                          fontSize: 32, fontFamily: 'Poppins-SemiBold'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Enter Your Email and we will send you a password reset link",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Poppins-Medium'),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email",
                            fillColor:
                                const Color.fromRGBO(217, 217, 217, 0.48),
                            filled: true,
                            prefixIcon: const Icon(Icons.email,
                                color: Color.fromRGBO(38, 50, 56, 1)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter E-mail";
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                .hasMatch(value)) {
                              return "Enter Correct E-mail.";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 39, 222, 191),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12), // Button padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () async {
                            print("object");
                          },
                          child: const Text(
                            "Forget Password",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Poppins-Medium'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
