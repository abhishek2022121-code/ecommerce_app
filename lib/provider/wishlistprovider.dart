import 'package:flutter/material.dart';

// Your Product Model
class Product {
  final String id;
  final String name;
  final String price;
  final String image;
  final String brand;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.brand,
  });
}

class WishlistProvider extends ChangeNotifier {
  // Start with an empty list so the screen shows "Empty" initially
  final List<Product> _wishlistItems = [];

  List<Product> get wishlistItems => _wishlistItems;

  void toggleWishlist(Product product) {
    final isExist = _wishlistItems.any((item) => item.id == product.id);
    if (isExist) {
      _wishlistItems.removeWhere((item) => item.id == product.id);
    } else {
      _wishlistItems.add(product);
    }
    notifyListeners(); // This triggers the UI rebuild
  }

  bool isFavorite(String productId) {
    return _wishlistItems.any((item) => item.id == productId);
  }
}
