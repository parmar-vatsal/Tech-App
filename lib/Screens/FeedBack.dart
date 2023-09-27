import 'package:flutter/material.dart';
import 'package:login/service/MailSending/FeedBackMail.dart';
import 'package:login/service/firebase/Submission/FBFeddBack.dart';

class FeedBackSC extends StatefulWidget {
  @override
  _FeedBackSCState createState() => _FeedBackSCState();
}

class _FeedBackSCState extends State<FeedBackSC> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _feedbackController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Feedback:',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Poppins-SemiBold",
                      fontSize: 18),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _feedbackController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey), // Define your desired color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.blue), // Define your desired color
                    ),
                    hintText: 'Enter your feedback here',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your feedback';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Process the feedback (e.g., send to server)
                      String feedback = _feedbackController.text;
                      // You can add your logic here to send the feedback
                      print('Feedback submitted: $feedback');

                      // Storing Data in firestore.
                      FBFeddBack.FbFeddBack(message: feedback);

                      // Mail Sending.
                      FeedBackMail.sendEmail();

                      // Show a confirmation dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Feedback Submitted'),
                            content: const Text('Thank you for your feedback!'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _feedbackController.clear();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 39, 222, 191),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Submit Feedback',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins-Regular",
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
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}
