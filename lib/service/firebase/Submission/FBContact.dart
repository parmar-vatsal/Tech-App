import 'package:cloud_firestore/cloud_firestore.dart';

class FBContact {
  static Future<void> FbContact(
      {required name,
      required email,
      required subject,
      required message}) async {
    try {
      CollectionReference userCollection =
          FirebaseFirestore.instance.collection("ContactUsForm");

      await userCollection.add({
        "Name": name,
        "Email": email,
        "Subject": subject,
        "Message": message
      });
    } catch (e) {
      print("ContactUsFormError -> $e");
    }
  }
}
