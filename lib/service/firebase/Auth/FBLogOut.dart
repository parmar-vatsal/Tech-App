import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> logoutUser() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  try {
    // Check if the user is signed in with Google
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }

    // Sign out the user using Firebase Authentication
    await auth.signOut();
  } catch (e) {
    print("Error logging out: $e");
  }
}
