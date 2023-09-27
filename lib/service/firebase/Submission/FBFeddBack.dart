import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FBFeddBack {
  static Future<void> FbFeddBack({required message}) async {
    var user_email = FirebaseAuth.instance.currentUser?.email;
    try {
      CollectionReference userCollection =
          FirebaseFirestore.instance.collection("FeedBackForm");

      await userCollection.add({"Email": user_email, "Message": message});
    } catch (e) {
      print("ContactUsFormError -> $e");
    }
  }
}
