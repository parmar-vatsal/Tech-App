import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/service/MailSending/ContactMail.dart';
import 'package:login/service/firebase/Submission/FBContact.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Future<bool> _onBackPressed() async {
    // Show confirmation dialog when the back button is pressed
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Exit the Application?',
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontFamily: "Poppins-Regular"),
            ),
            content: const Text(
              'Are you sure you want to leave the Tech App?',
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontFamily: "Poppins-Regular"),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Stay on the screen
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Poppins-Regular"),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Leave the Privacy Policy
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Poppins-Regular"),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController subjectController = new TextEditingController();
  TextEditingController messageController = new TextEditingController();

  final contactFormKey = GlobalKey<FormState>();

  var finalemail = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Contact Form",
                    style:
                        TextStyle(fontSize: 32, fontFamily: "Poppins-SemiBold"),
                  ),
                  // SizedBox(height: 4),
                  const Text(
                    "Reach out to us! Whether you have questions, suggestions, or simply want to connect, our contact form is here for you. Let's chat!",
                    style:
                        TextStyle(fontSize: 12, fontFamily: "Poppins-Medium"),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  Form(
                    key: contactFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          autofocus: true,
                          controller: nameController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Name",
                            prefixIcon: const Icon(Icons.person),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15)),
                            fillColor: Colors.grey.withOpacity(0.1),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your Name";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          autofocus: true,
                          controller: subjectController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Subject",
                            prefixIcon: const Icon(Icons.topic),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            fillColor: Colors.grey.withOpacity(0.1),
                            filled: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your Subject.";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          maxLength: 1500,
                          controller: messageController,
                          maxLines: 3,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: "Enter Your Message",
                            prefixIcon: const Icon(Icons.message),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15)),
                            fillColor: Colors.grey.withOpacity(0.1),
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.toString().trim();
                      // String email = emailController.text.toString().trim();
                      String subject = subjectController.text.toString().trim();
                      String message = messageController.text.toString().trim();
                      if (contactFormKey.currentState!.validate()) {
                        try {
                          FBContact.FbContact(
                              name: name,
                              email: finalemail,
                              subject: subject,
                              message: message);

                          Fluttertoast.showToast(
                            msg: "Form submitted successfully!",
                            toastLength: Toast.LENGTH_SHORT,
                            // gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.grey[800],
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );

                          contactFormKey.currentState!.reset();

                          Contactmail.sendEmail(
                              emailAddress: finalemail, userName: name);
                        } catch (e) {
                          print("$e");
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 39, 222, 191),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins-Medium",
                              fontSize: 18),
                        ),
                        SizedBox(width: 12),
                        Icon(
                          Icons.send,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
