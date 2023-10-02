import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/service/firebase/Auth/FBSignUp.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart'; // Import the overlay_loader_with_app_icon package
import 'package:login/Screens/AuthScreen/SignUpScreen.dart';
import 'package:login/Screens/DrawerScreen/DrawerScreen.dart';
import 'package:login/service/firebase/Auth/FBLogin.dart';
import 'package:login/utiles/UserAuthUtils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false; // Add this variable

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user?.displayName);
    if (userCredential.user != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePageScreen()),
      );
    }
  }

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
                    Image.asset("Assets/img/Vector-img.jpg", width: 300),
                    const SizedBox(height: 10),
                    const Text(
                      "Login Now",
                      style: TextStyle(
                          fontSize: 32, fontFamily: 'Poppins-SemiBold'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "please enter the details below to continue",
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
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: passController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            fillColor:
                                const Color.fromRGBO(217, 217, 217, 0.48),
                            filled: true,
                            prefixIcon: const Icon(Icons.password,
                                color: Color.fromRGBO(38, 50, 56, 1)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        TextButton(
                          child: const Text("Forgot password?",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w100,
                                  fontFamily: 'Poppins-Medium')),
                          onPressed: () {
                            print("Password Forget");
                          },
                        ),
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
                            setState(() {
                              isLoading = true;
                            });

                            try {
                              if (formKey.currentState!.validate()) {
                                if (emailController.text.isEmpty ||
                                    passController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('All Fields Are Required.'),
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                } else {
                                  await FBLogin.FbLogin(
                                      context: context,
                                      emailController: emailController.text,
                                      passController: passController.text);
                                }
                              }
                            } catch (e) {
                              print("error -- $e");
                            } finally {
                              setState(() {
                                isLoading = false; // Hide loader when done
                              });
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Poppins-Medium'),
                          ),
                        ),
                        const SizedBox(height: 14),
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            try {
                              await signInWithGoogle();
                              // Handle successful Google sign-in
                            } catch (error) {
                              // Handle sign-in error
                              print("Error signing in with Google: $error");
                            } finally {
                              setState(() {
                                isLoading = false; // Hide loader when done
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'Assets/img/google_logo.png', // Replace with actual logo path
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Login with Google',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: "Poppins-Medium"),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                                fontFamily: 'Poppins-Medium',
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                UserAuthUtils.userEmail = emailController.text;
                                UserAuthUtils.passWord = passController.text;

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen()));
                              },
                              child: const Text(
                                "Register",
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
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
