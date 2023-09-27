import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  List<String> wishlistItems = [];

  // Method to add a product to the wishlist
  void addToWishlist(String productId) {
    if (!wishlistItems.contains(productId)) {
      wishlistItems.add(productId);
      notifyListeners();
    }
  }

  // Method to remove a product from the wishlist
  void removeFromWishlist(String productId) {
    if (wishlistItems.contains(productId)) {
      wishlistItems.remove(productId);
      notifyListeners();
    }
  }

  // Method to check if a product is in the wishlist
  bool isProductInWishlist(String productId) {
    return wishlistItems.contains(productId);
  }
}
