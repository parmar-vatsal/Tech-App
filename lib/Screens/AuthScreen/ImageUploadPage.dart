// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:io';

// class ImageUploadPage extends StatefulWidget {
//   @override
//   _ImageUploadPageState createState() => _ImageUploadPageState();
// }

// class _ImageUploadPageState extends State<ImageUploadPage> {
//   File? _image;
//   String? _imageUrl;

//   final picker = ImagePicker();

//   Future getImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future<void> uploadImage() async {
//     if (_image == null) {
//       // Handle the case where no image is selected
//       return;
//     }

//     final firebaseStorageRef = FirebaseStorage.instance
//         .ref()
//         .child('user_avatars/${DateTime.now()}.png');

//     try {
//       await firebaseStorageRef.putFile(_image!);
//       final downloadURL = await firebaseStorageRef.getDownloadURL();

//       setState(() {
//         _imageUrl = downloadURL;
//       });

//       // Store the download URL in Firestore or wherever you need it
//       // Example:
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc('user_id') // Replace with the user's unique identifier
//           .update({'avatarUrl': _imageUrl});
//     } catch (e) {
//       print('Error uploading image: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Upload Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null
//                 ? Text('No image selected.')
//                 : Image.file(
//                     _image!,
//                     width: 200,
//                     height: 200,
//                   ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: getImage,
//               child: Text('Select Image'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: uploadImage,
//               child: Text('Upload Image'),
//             ),
//             _imageUrl != null
//                 ? Text('Image URL: $_imageUrl')
//                 : SizedBox.shrink(),
//           ],
//         ),
//       ),
//     );
//   }
// }