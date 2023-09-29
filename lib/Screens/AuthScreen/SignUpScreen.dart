import 'package:flutter/material.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/Screens/AuthScreen/LoginScreen.dart';
import 'package:login/service/firebase/Auth/FBSignUp.dart';
import 'package:login/utiles/UserAuthUtils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  bool isLoading = false;

  bool validatePassword(String pass) {
    String password = pass.trim();

    if (pass_valid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTxtField = TextEditingController();
    TextEditingController passTxtField = TextEditingController();
    TextEditingController nameController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    if (UserAuthUtils.passWord != "" && UserAuthUtils.userEmail != "") {
      emailTxtField.text = UserAuthUtils.userEmail;
      passTxtField.text = UserAuthUtils.passWord;
    }

    return OverlayLoaderWithAppIcon(
      isLoading: isLoading,
      appIcon: Image.asset('Assets/img/Hourglass_loader.gif'),
      appIconSize: 80,
      overlayBackgroundColor: Colors.white,
      circularProgressColor: Colors.transparent,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("Assets/img/Vector-img.jpg", width: 300),
                const SizedBox(height: 10),
                const Text(
                  "Signup Now",
                  style:
                      TextStyle(fontSize: 32, fontFamily: 'Poppins-SemiBold'),
                ),
                const SizedBox(height: 10),
                const Text(
                  "please enter the details below to join with us",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Poppins-Medium'),
                ),
                const SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Your Name",
                          fillColor: const Color.fromRGBO(217, 217, 217, 0.48),
                          filled: true,
                          prefixIcon: const Icon(Icons.people,
                              color: Color.fromRGBO(38, 50, 56, 1)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Name";
                          } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return "Please Enter Correct Name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: emailTxtField,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Email",
                          fillColor: const Color.fromRGBO(217, 217, 217, 0.48),
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
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                              .hasMatch(value)) {
                            return "Enter Correct E-mail.";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        controller: passTxtField,
                        decoration: InputDecoration(
                          hintText: "Password",
                          fillColor: const Color.fromRGBO(217, 217, 217, 0.48),
                          filled: true,
                          prefixIcon: const Icon(Icons.password,
                              color: Color.fromRGBO(38, 50, 56, 1)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 13),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(39, 222, 191, 1),
                          padding: EdgeInsets.symmetric(
                              vertical: 12), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          String email = emailTxtField.text;
                          String passWord = passTxtField.text;

                          if (formKey.currentState!.validate()) {
                            try {
                              setState(() {
                                isLoading = true; // Show the loader
                              });

                              await FBSignUp.signUp(
                                context: context,
                                email: email,
                                password: passWord,
                                name: nameController.text,
                              );
                            } catch (e) {
                              print("SignUp --> $e");
                            } finally {
                              setState(() {
                                isLoading = false; // Hide the loader when done
                              });
                            }
                          }
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Poppins-Medium'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "If you have already an account?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Poppins-Medium',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Color.fromRGBO(39, 222, 191, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Poppins-Medium',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
