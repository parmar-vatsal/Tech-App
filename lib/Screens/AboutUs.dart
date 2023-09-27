import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Logo Section
              Container(
                margin: const EdgeInsets.all(25),
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 0,
                    ),
                  ],
                  color: const Color.fromRGBO(255, 228, 204, 1),
                  image: const DecorationImage(
                    image: AssetImage("Assets/img/app_logo.png"),
                  ),
                ),
              ),
              // Text Section
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Each paragraph is wrapped in a Card for a cleaner look
                    _buildParagraph(
                      "Welcome to our visionary college project turned reality - an innovative e-commerce platform designed to showcase the future of tech! We're thrilled to introduce you to Tech App, the result of our passion for technology and entrepreneurship.",
                    ),
                    _buildParagraph(
                      "As students with a shared love for all things tech, we embarked on this journey to create a virtual space where fellow tech enthusiasts and curious minds can explore, learn, and acquire the latest gadgets and electronic wonders.",
                    ),
                    _buildParagraph(
                      "Our project isn't just about products; it's about the experience. We've meticulously crafted an intuitive interface that allows you to delve into detailed product insights, make comparisons, and understand the nuances of each item.",
                    ),
                    _buildParagraph(
                      "What sets us apart is our commitment to education. We're not just selling products; we're fostering a tech-savvy community.",
                    ),
                    _buildParagraph(
                      "Join us in celebrating technology and innovation. This project represents countless hours of learning, determination, and teamwork. Let's redefine e-commerce together through Tech App!",
                    ),
                    _buildParagraph(
                      "Feel free to share your thoughts with us by filling out our feedback form. Your insights are valuable in helping us enhance your experience.",
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Follw Us -> ",
                      style: TextStyle(
                          fontFamily: "Poppins-Medium", fontSize: 14)),
                  IconButton(
                    onPressed: () {
                      // Handle Instagram link
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 30,
                      color:
                          Color.fromRGBO(79, 91, 213, 1), // Customize the color
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle Facebook link
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 30,
                      color: Color.fromRGBO(
                          12, 142, 242, 1), // Customize the color
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle LinkedIn link
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.linkedin,
                      size: 30,
                      color: Color.fromRGBO(
                          40, 102, 177, 1), // Customize the color
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create a paragraph with consistent styling
  Widget _buildParagraph(String text) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "Poppins-Regular",
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
