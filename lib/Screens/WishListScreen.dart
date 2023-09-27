import 'package:flutter/material.dart';

class WishlistItem {
  final String productName;

  WishlistItem({
    required this.productName,
  });
}

class WishlistScreen extends StatefulWidget {
  final List<WishlistItem> wishlistItems;

  const WishlistScreen({required this.wishlistItems});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[800]),
        backgroundColor: const Color.fromARGB(255, 39, 222, 191),
        title: Image.asset(
          "Assets/img/app_logo.png",
          width: 170,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: widget.wishlistItems.length,
        itemBuilder: (context, index) {
          final item = widget.wishlistItems[index];
          return ListTile(
            title: Text(item.productName),
            // You can include additional UI elements or actions here
          );
        },
      ),
    );
  }
}